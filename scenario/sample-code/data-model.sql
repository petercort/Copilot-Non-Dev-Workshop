-- ============================================================
-- Returns Portal — PostgreSQL Data Model
-- ============================================================
-- Tables: customers, orders, order_items, return_requests, return_items
-- Assumes a separate product catalog service owns the products table.
-- ============================================================

-- ============================================================
-- customers
-- ============================================================
CREATE TABLE customers (
    customer_id     SERIAL PRIMARY KEY,
    email           VARCHAR(255) NOT NULL UNIQUE,
    full_name       VARCHAR(255) NOT NULL,
    phone           VARCHAR(30),
    sso_subject     VARCHAR(255) UNIQUE,          -- Okta subject claim
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_customers_email ON customers (email);
CREATE INDEX idx_customers_sso_subject ON customers (sso_subject);

COMMENT ON TABLE customers IS 'Registered customer accounts. Linked to Okta SSO via sso_subject.';
COMMENT ON COLUMN customers.sso_subject IS 'Okta subject (sub) claim used to map SSO sessions to local records.';


-- ============================================================
-- orders
-- ============================================================
CREATE TABLE orders (
    order_id        SERIAL PRIMARY KEY,
    customer_id     INT NOT NULL REFERENCES customers (customer_id) ON DELETE RESTRICT,
    order_date      DATE NOT NULL,
    total_amount    NUMERIC(10, 2) NOT NULL CHECK (total_amount >= 0),
    currency        CHAR(3) NOT NULL DEFAULT 'USD',
    status          VARCHAR(50) NOT NULL DEFAULT 'completed',  -- completed, cancelled, partially_refunded
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_orders_customer_id ON orders (customer_id);
CREATE INDEX idx_orders_order_date  ON orders (order_date);

COMMENT ON TABLE orders IS 'Customer orders. Sourced from OMS; replicated here for returns eligibility checks.';


-- ============================================================
-- order_items
-- ============================================================
CREATE TABLE order_items (
    order_item_id       SERIAL PRIMARY KEY,
    order_id            INT NOT NULL REFERENCES orders (order_id) ON DELETE CASCADE,
    product_sku         VARCHAR(100) NOT NULL,
    product_name        VARCHAR(255) NOT NULL,
    product_category    VARCHAR(100),                -- e.g. 'electronics', 'digital', 'final_sale'
    quantity            INT NOT NULL CHECK (quantity > 0),
    unit_price          NUMERIC(10, 2) NOT NULL CHECK (unit_price >= 0),
    is_returnable       BOOLEAN NOT NULL DEFAULT TRUE,
    created_at          TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_order_items_order_id ON order_items (order_id);

COMMENT ON TABLE order_items IS 'Line items within an order. is_returnable is denormalized from product catalog at order time.';
COMMENT ON COLUMN order_items.product_category IS 'Category at time of purchase. Used for eligibility rules (digital, final_sale are non-returnable).';


-- ============================================================
-- return_requests
-- ============================================================
CREATE TYPE return_status AS ENUM (
    'submitted',
    'under_review',
    'approved',
    'rejected',
    'item_received',
    'refund_issued'
);

CREATE TABLE return_requests (
    return_id       SERIAL PRIMARY KEY,
    customer_id     INT NOT NULL REFERENCES customers (customer_id) ON DELETE RESTRICT,
    order_id        INT NOT NULL REFERENCES orders (order_id) ON DELETE RESTRICT,
    status          return_status NOT NULL DEFAULT 'submitted',
    notes           TEXT CHECK (char_length(notes) <= 500),
    submitted_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    -- Prevent duplicate open returns for the same order
    CONSTRAINT uq_one_open_return_per_order UNIQUE (order_id, status) 
        DEFERRABLE INITIALLY DEFERRED
);

CREATE INDEX idx_return_requests_customer_id ON return_requests (customer_id);
CREATE INDEX idx_return_requests_order_id    ON return_requests (order_id);
CREATE INDEX idx_return_requests_status      ON return_requests (status);

COMMENT ON TABLE return_requests IS 'Top-level return request record. One return per order at a time.';
COMMENT ON COLUMN return_requests.notes IS 'Optional customer-provided notes (500 char max).';


-- ============================================================
-- return_items
-- ============================================================
CREATE TABLE return_items (
    return_item_id  SERIAL PRIMARY KEY,
    return_id       INT NOT NULL REFERENCES return_requests (return_id) ON DELETE CASCADE,
    order_item_id   INT NOT NULL REFERENCES order_items (order_item_id) ON DELETE RESTRICT,
    quantity        INT NOT NULL CHECK (quantity > 0),
    reason          VARCHAR(100) NOT NULL,  -- defective, wrong_item, changed_mind, damaged_in_shipping, other
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    -- Cannot return more units than were ordered
    CONSTRAINT chk_return_qty_positive CHECK (quantity > 0)
);

CREATE INDEX idx_return_items_return_id     ON return_items (return_id);
CREATE INDEX idx_return_items_order_item_id ON return_items (order_item_id);

COMMENT ON TABLE return_items IS 'Individual items included in a return request.';
COMMENT ON COLUMN return_items.reason IS 'Reason code selected by customer: defective, wrong_item, changed_mind, damaged_in_shipping, other.';


-- ============================================================
-- return_audit_log  (immutable — no UPDATE/DELETE)
-- ============================================================
CREATE TABLE return_audit_log (
    log_id          SERIAL PRIMARY KEY,
    return_id       INT NOT NULL REFERENCES return_requests (return_id) ON DELETE RESTRICT,
    event_type      VARCHAR(50) NOT NULL,  -- CREATED, STATUS_CHANGED, ADMIN_OVERRIDE, REFUND_INITIATED
    from_status     return_status,
    to_status       return_status,
    actor           VARCHAR(255) NOT NULL,  -- customer_id, admin username, or 'system'
    metadata        JSONB,                  -- additional context (e.g. reason for override)
    occurred_at     TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_audit_return_id    ON return_audit_log (return_id);
CREATE INDEX idx_audit_occurred_at  ON return_audit_log (occurred_at);
CREATE INDEX idx_audit_event_type   ON return_audit_log (event_type);

COMMENT ON TABLE return_audit_log IS 'Immutable audit trail for all return request events. Required by Finance/Legal (7-year retention).';

-- Prevent modifications to audit records
CREATE RULE no_update_audit AS ON UPDATE TO return_audit_log DO INSTEAD NOTHING;
CREATE RULE no_delete_audit AS ON DELETE TO return_audit_log DO INSTEAD NOTHING;
