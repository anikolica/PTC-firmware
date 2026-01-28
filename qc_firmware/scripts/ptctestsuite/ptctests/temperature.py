import os
from time import sleep
from loguru import logger as lg

from ptctestsuite import test_base, qc_result

# I totally forgot that this will run externally....
# TODO refactor so that it takes the readings via ssh/serial

class temperature_test(test_base):
    
    def read_temp(self, addr):
        #Read the temperature register 'word'
        i2c_raw = os.popen('i2cget -y 0 ' + addr + ' 0x00 w').read()
        #i2cget gives byte-swapped output
        i2c_dec = ((int((i2c_raw)[4:6],16) << 8) + int((i2c_raw)[2:4],16))
        # Note that two's comp can give neg temp - should never see on PTC
        return i2c_dec * 00.0078125 #conversion to degC on TMP117
 
    def test_init(self) -> bool:
        lg.info("Starting temperature sensor test...")
        temp_monitor_list = ['0x48', '0x49', '0x4A', '0x4B']
        self.readings = {v: float(0) for v in temp_monitor_list}
        self.sleep_time = 0.1
        # in degrees celsius.....
        # room temperature varies significantly, especially in DRL
        # but 15-30 C are ranges that humans can definitely tolerate
        self.temp_accept_low = 15
        self.temp_accept_high = 30
        # just going to return true here since all we're doing is setting up some values
        return True

    def run_test(self) -> qc_result:
        for addr in self.readings.keys():
            try:
                self.readings[addr] = self.read_temp(addr)
                sleep(self.sleep_time)
            except Exception as e:
                lg.error("Temperature reading failed!")
                lg.exception(e)
                return qc_result.FAIL
            
        for a,r in self.readings.items():
            if self.temp_accept_low < r and r < self.temp_accept_high:
                lg.error(f"Temperature readings outside of normal range. Sensor {a} reported a value of {r}.")
                return qc_result.FAIL
        lg.info("Temperature sensor test passed.")
        return qc_result.PASS