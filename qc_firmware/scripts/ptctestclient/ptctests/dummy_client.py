from ptctestclient.utils import test_base
from ptctestclient.utils import qc_result

class dummy_client(test_base):
    def __init__(self, name: str = "Dummy"):
        self._name = name 

    def run_test(self):
        return qc_result.PASS

    def test_init(self) -> bool:
        return super().test_init()
    
    def test_end(self) -> bool:
        return super().test_end()
        