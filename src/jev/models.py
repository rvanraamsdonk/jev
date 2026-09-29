"""Example domain model. Replace with real JEV types."""

from pydantic import BaseModel, ConfigDict, Field


class Entry(BaseModel):
    """Immutable, strictly validated record."""

    model_config = ConfigDict(frozen=True, strict=True, extra="forbid")

    id: int = Field(gt=0)
    name: str = Field(min_length=1)
