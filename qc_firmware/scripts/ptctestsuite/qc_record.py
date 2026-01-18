from dataclasses import dataclass
from datetime import datetime

@dataclass
class qc_record:
    version: int
    created_date: datetime
    created_by: str
    datasheet: dict