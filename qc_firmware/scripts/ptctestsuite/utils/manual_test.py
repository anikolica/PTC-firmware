from ptctestsuite import test_base
from ptctestsuite import qc_result
from loguru import Logger as lg

class manual_test(test_base):

    def __init__(self, test_name: str):
        self._test_name = test_name 
        # overriding this for the dict of pretty print names
        self.__class__.__name__ = test_name
        # setting this as error by default
        self._test_status = qc_result.ERROR
        self._test_value = None
    
    @property
    def test_name(self):
        return self._test_name

    @test_name.setter
    def test_name(self, value: str):
        try:
            self._test_name = str(value)
            self.__class__.__name__ = str(value)
        except:
            raise ValueError("Cannot cast passed value to a string.")

    @property
    def test_status(self):
        return self._test_status

    # simple getter and setter method for this one. 
    # expectation is that the tester will indicate pass or fail
    # TODO review if that is the preferred behaviour
    @test_status.setter
    def test_status(self, status: qc_result):
        self._test_status = status

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
