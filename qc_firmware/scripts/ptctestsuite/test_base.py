from abc import ABC, abstractmethod
from ptctestsuite import qc_result

from loguru import logger as lg

# Here, we lay out the interface definition for a test.
# These will be classes, simply because it gives me the ability to write an interface, 
# and have the tests comply with it.
# The intent is to have the lifetime be handled using the `with` statment, e.g.
# with test_name as t:
#   << potentially do some work here >>
#   t.run_test()
#   << potentially more work here >>

test_pretty_names = {
    "eeprom": "EEPROM",
    "temperature_test": "Temperature",
    "gbe_test": "GBe"
}

class test_base(ABC):
    
    @abstractmethod
    def test_init(self) -> bool:
        """ Test Init Stub. Returns boolean indicating if initialization passed or failed"""
        # Default of simply logging that test has initialized
        lg.info(f"Starting {test_pretty_names[self.__class__.__name__]} test...")
        return True


    @abstractmethod 
    def run_test(self) -> qc_result:
        """ Test run stub. Returns a `qc_result` object indication the outcome of the test"""
        pass

    @abstractmethod
    def test_end(self) -> bool:
        """Test de-init stub. Returns boolean indicating status"""
        # Similar to initialize method
        lg.info(f"Finished {test_pretty_names[self.__class__.__name__]} test.")

    def __enter__(self):
        test_init_status = self.test_init()
        if not test_init_status:
            # TODO maybe change these to use logging instead of throwing a runtime error?
            raise RuntimeError(f"{test_pretty_names[self.__class__.__name__]} Test Initialization Failed") 

    def __exit__(self, exception_type, exception_value, exception_traceback):
        test_end_status = self.test_end()
        if not test_end_status:
            # TODO maybe change these to use logging instead of throwing a runtime error?
            raise RuntimeError(f"{test_pretty_names[self.__class__.__name__]} Test Exit Failed")

