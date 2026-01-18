from abc import ABC, abstractmethod
from ptctestsuite import qc_result

# Here, we lay out the interface definition for a test.
# These will be classes, simply because it gives me the ability to write an interface, 
# and have the tests comply with it.
# The intent is to have the lifetime be handled using the `with` statment, e.g.
# with test_name as t:
#   << potentially do some work here >>
#   t.run_test()
#   << potentially more work here >>

class test_base(ABC):
    
    @abstractmethod
    def test_init(self) -> bool:
        """ Test Init Stub. Returns boolean indicating if initialization passed or failed"""
        pass

    @abstractmethod 
    def run_test(self) -> qc_result:
        """ Test run stub. Returns a `qc_result` object indication the outcome of the test"""
        pass

    @abstractmethod
    def test_end(self) -> bool:
        """Test de-init stub. Returns boolean indicating status"""
        pass

    def __enter__(self):
        self.test_init()

    def __exit__(self, exception_type, exception_value, exception_traceback):
        self.test_end()
