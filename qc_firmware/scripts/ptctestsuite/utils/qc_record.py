from dataclasses import dataclass, asdict
from datetime import datetime
import yaml
import time

# this may be unnecessary. Need to check how the HWDB REST API works
@dataclass
class hwdb_record:
    version: int
    created_date: datetime
    created_by: str
    datasheet: dict

@dataclass
class qc_record:
    serial_number: str
    tester_name: str
    test_status: dict
    tester_notes: str
    test_location: str = "University of Pennsylvania"
    test_datetime: datetime = datetime.now()

    def gen_hwdb_datasheet(self):
        dd = asdict(self)
        dd['test_date'] = dd['test_datetime'].strftime("%Y-%m-%d")
        dd['test_time'] = f"{dd['test_datetime'].strftime('%H:%M:%S')} {time.tzname[0]}"
        return yaml.dump(dd, sort_keys=False)