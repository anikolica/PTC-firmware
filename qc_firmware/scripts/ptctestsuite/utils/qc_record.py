from dataclasses import dataclass, asdict, field
from datetime import datetime
from enum import Enum
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
    test_status: dict = field(default_factory=dict)
    tester_notes: str = ""
    test_location: str = "University of Pennsylvania"
    test_datetime: datetime = field(default_factory=datetime.now)

    def gen_hwdb_datasheet(self):

        def clean_enums(obj):
            if isinstance(obj, dict):
                return {k: clean_enums(v) for k, v in obj.items()}
            elif isinstance(obj, list):
                return [clean_enums(v) for v in obj]
            elif isinstance(obj, Enum):
                return obj.name
            return obj
        
        dd = asdict(self)
        dd = clean_enums(dd)
        dd['test_date'] = dd['test_datetime'].strftime("%Y-%m-%d")
        dd['test_time'] = f"{dd['test_datetime'].strftime('%H:%M:%S')} {time.tzname[0]}"
        return yaml.dump(dd, sort_keys=False)