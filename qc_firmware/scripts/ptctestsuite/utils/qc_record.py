from dataclasses import dataclass, asdict
from datetime import datetime
import yaml

# this may be unnecessary. Need to check how the HWDB REST API works
@dataclass
class hwdb_record:
    version: int
    created_date: datetime
    created_by: str
    datasheet: dict

@dataclass
class qc_record:
    test_status: dict
    serial_number: str
    tester_name: str
    test_location: str = "University of Pennsylvania"
    test_datetime: datetime = datetime.now()

    def gen_hwdb_datasheet(self):
        return yaml.dump(asdict(self))