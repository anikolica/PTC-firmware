from ptctestsuite.utils.test_base import test_base
from ptctestsuite.utils.qc_result import qc_result
from loguru import logger as lg

class dummy_test(test_base):
    def __init__(self, name: str):
        self._name = name 

    def run_test(self):
        lg.info(f"Running dummy test named {self._name}")
        return qc_result.PASS

    def test_init(self) -> bool:
        return super().test_init()
    
    def test_end(self) -> bool:
        return super().test_end()
        