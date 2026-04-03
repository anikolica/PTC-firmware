from enum import Enum

class qc_result(int, Enum):
    FAIL = 0
    PASS = 1
    ERROR = 2