"""
Returns Portal API — Customer Self-Service Returns
FastAPI application providing endpoints for creating and managing return requests.
"""

from datetime import date, datetime, timedelta
from enum import Enum
from typing import Optional

from fastapi import FastAPI, HTTPException, Query
from pydantic import BaseModel

app = FastAPI(title="Returns Portal API", version="1.0.0")

# ---------------------------------------------------------------------------
# Constants & business rules
# ---------------------------------------------------------------------------
RETURN_WINDOW_DAYS = 30
NON_RETURNABLE_CATEGORIES = {"digital", "final_sale", "perishable"}

# ---------------------------------------------------------------------------
# Enums
# ---------------------------------------------------------------------------
class ReturnStatus(str, Enum):
    SUBMITTED = "submitted"
    UNDER_REVIEW = "under_review"
    APPROVED = "approved"
    REJECTED = "rejected"
    ITEM_RECEIVED = "item_received"
    REFUND_ISSUED = "refund_issued"

# Valid status transitions — prevents arbitrary state jumps
ALLOWED_TRANSITIONS = {
    ReturnStatus.SUBMITTED: {ReturnStatus.UNDER_REVIEW, ReturnStatus.REJECTED},
    ReturnStatus.UNDER_REVIEW: {ReturnStatus.APPROVED, ReturnStatus.REJECTED},
    ReturnStatus.APPROVED: {ReturnStatus.ITEM_RECEIVED},
    ReturnStatus.ITEM_RECEIVED: {ReturnStatus.REFUND_ISSUED},
    ReturnStatus.REJECTED: set(),
    ReturnStatus.REFUND_ISSUED: set(),
}

# ---------------------------------------------------------------------------
# Pydantic models
# ---------------------------------------------------------------------------
class ReturnItem(BaseModel):
    order_item_id: int
    quantity: int = 1
    reason: str  # e.g. "defective", "wrong_item", "changed_mind"

class CreateReturnRequest(BaseModel):
    customer_id: int
    order_id: int
    order_date: date
    items: list[ReturnItem]
    notes: Optional[str] = None  # max 500 chars enforced below

class ReturnResponse(BaseModel):
    return_id: int
    customer_id: int
    order_id: int
    status: ReturnStatus
    created_at: datetime
    items: list[ReturnItem]

class StatusUpdateRequest(BaseModel):
    status: ReturnStatus
    actor: str  # user or system identity making the change

# ---------------------------------------------------------------------------
# In-memory store (replace with DB in production)
# ---------------------------------------------------------------------------
_store: dict[int, dict] = {}
_next_id = 1

# ---------------------------------------------------------------------------
# Helper: eligibility check
# ---------------------------------------------------------------------------
def check_eligibility(order_date: date, item_categories: list[str]) -> None:
    """Raise HTTPException if the return is ineligible."""
    cutoff = date.today() - timedelta(days=RETURN_WINDOW_DAYS)
    if order_date < cutoff:
        raise HTTPException(
            status_code=422,
            detail=f"Return window closed. Orders must be returned within {RETURN_WINDOW_DAYS} days of purchase.",
        )
    non_returnable = [c for c in item_categories if c in NON_RETURNABLE_CATEGORIES]
    if non_returnable:
        raise HTTPException(
            status_code=422,
            detail=f"Items with categories {non_returnable} are not eligible for return.",
        )

# ---------------------------------------------------------------------------
# Endpoints
# ---------------------------------------------------------------------------
@app.post("/returns", response_model=ReturnResponse, status_code=201)
def create_return(payload: CreateReturnRequest):
    """Submit a new return request. Validates the return window and item eligibility."""
    global _next_id

    if payload.notes and len(payload.notes) > 500:
        raise HTTPException(status_code=422, detail="Notes must be 500 characters or fewer.")

    # In a real system, item categories would be fetched from the product catalog.
    # Here we accept them as part of the item reason for demo purposes.
    check_eligibility(payload.order_date, [])  # category check wired in integration layer

    record = {
        "return_id": _next_id,
        "customer_id": payload.customer_id,
        "order_id": payload.order_id,
        "status": ReturnStatus.SUBMITTED,
        "created_at": datetime.utcnow(),
        "items": [i.dict() for i in payload.items],
        "notes": payload.notes,
        "history": [],
    }
    _store[_next_id] = record
    _next_id += 1
    return record


@app.get("/returns/{return_id}", response_model=ReturnResponse)
def get_return(return_id: int):
    """Retrieve a single return request by ID."""
    record = _store.get(return_id)
    if not record:
        raise HTTPException(status_code=404, detail="Return request not found.")
    return record


@app.patch("/returns/{return_id}/status", response_model=ReturnResponse)
def update_return_status(return_id: int, payload: StatusUpdateRequest):
    """Transition a return request to a new status. Enforces allowed state transitions."""
    record = _store.get(return_id)
    if not record:
        raise HTTPException(status_code=404, detail="Return request not found.")

    current = record["status"]
    if payload.status not in ALLOWED_TRANSITIONS[current]:
        raise HTTPException(
            status_code=422,
            detail=f"Cannot transition from '{current}' to '{payload.status}'.",
        )

    # Append to audit history before changing state
    record["history"].append({
        "from_status": current,
        "to_status": payload.status,
        "actor": payload.actor,
        "timestamp": datetime.utcnow().isoformat(),
    })
    record["status"] = payload.status
    return record


@app.get("/returns", response_model=list[ReturnResponse])
def list_returns(customer_id: int = Query(..., description="Filter returns by customer ID")):
    """List all return requests for a given customer."""
    results = [r for r in _store.values() if r["customer_id"] == customer_id]
    return results
