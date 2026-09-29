import pytest
from pydantic import ValidationError

from jev.models import Entry


def test_valid_entry() -> None:
    assert Entry(id=1, name="a").name == "a"


def test_rejects_coercion() -> None:
    with pytest.raises(ValidationError):
        Entry.model_validate({"id": "1", "name": "a"})
