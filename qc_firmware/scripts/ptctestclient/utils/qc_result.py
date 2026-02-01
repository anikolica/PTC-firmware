from enum import Enum

class qc_result(int, Enum):
    PASS = 0
    FAIL = 1
    ERROR = 2