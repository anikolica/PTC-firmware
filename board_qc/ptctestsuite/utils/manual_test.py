from .test_base import test_base
from .qc_result import qc_result
from loguru import logger as lg

class manual_test(test_base):

    def __init__(self, test_name: str = "Manual Test", test_message: str = "Did the test pass? ", accepts_value: bool = False):
        """Constructor for configurable manual test class

        Args:
            test_name (str, optional): What the test is for. Defaults to "Manual Test".
            test_message (str, optional): How to prompt the tester. Defaults to "Did the test pass? ".
            accepts_value (bool, optional): Denotes if the test accepts a value or not. Defaults to False.
        """
        self._test_name = test_name 
        # overriding this for the dict of pretty print names
        self.__class__.__name__ = test_name
        # setting this as error by default
        self._test_status = qc_result.ERROR
        self._test_value = None
        self._test_message = test_message
        self._accepts_value = accepts_value
    
    @property
    def accepts_value(self) -> bool:
        return self._accepts_value
        
    @property
    def message(self) -> str:
        return self._test_message
    
    @property
    def test_name(self) -> str:
        return self._test_name

    @test_name.setter
    def test_name(self, value: str) -> None:
        try:
            self._test_name = str(value)
            self.__class__.__name__ = str(value)
        except:
            raise ValueError("Cannot cast passed value to a string.")

    @property
    def test_status(self) -> qc_result:
        return self._test_status

    # simple getter and setter method for this one. 
    # expectation is that the tester will indicate pass or fail
    # TODO review if that is the preferred behaviour
    @test_status.setter
    def test_status(self, status: qc_result) -> None:
        self._test_status = status

    def test_init(self):
        return True
    
    def test_end(self):
        return True

    # getter and setter method here in case we'd like
    # the tester to supply a reading
    # this will be a string so we can store repns of arbitrary
    # types, and we will not be doing any checking
    @property
    def test_value(self):
        return self._test_value
    
    @test_value.setter
    def test_value(self, value: str):
        self._test_value = value

    def run_test(self) -> qc_result:
        return self._test_status
