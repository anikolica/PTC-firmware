import os
from time import sleep
from loguru import logger as lg

from ptctestclient.utils import test_base, qc_result


class voltage_curr_test(test_base):
    
    def read_voltage(self, addr):
        try:
            i2c_raw = os.popen('i2cget -y 0 ' + addr + ' 0x1e w').read()
            i2c_dec =((int((i2c_raw)[4:6], 16) << 8) + int((i2c_raw)[2:4], 16)) >> 4
            voltage = i2c_dec * 0.025
            return voltage
        except Exception as e:
            lg.error(f"Voltage reading failed for sensor {addr}")
            lg.exception(e)
            return None
    
    def read_current(self, addr, resistor):
        try:
            i2c_raw = os.popen('i2cget -y 0 ' + addr + ' 0x14 w').read()
            i2c_dec =((int((i2c_raw)[4:6], 16) << 8) + int((i2c_raw)[2:4], 16)) >> 4
            current = i2c_dec * 0.000025 / resistor
            return current
        except Exception as e:
            lg.error(f"Current reading failed for sensor {addr}")
            lg.exception(e)
            return None
        
 
    def test_init(self) -> bool:
        lg.info("Starting volate and current sensor test...")
        iv_monitors = ['0x67', '0x68', '0x69', '0x6a', '0x6b', '0x6c', '0x6e', '0x6f']
        self.readings = {v: {"v": float(0), 'i': float(0)} for v in iv_monitors}
        
        # regs_3v3_2v5_monitors = ['0x6e', '0x6f']
        
        self.sleep_time = 0.1

        # for 25% PWM duty cycle (0x216)
        self.voltage_min = 12
        self.volatge_max = 12.35
        self.current_min = 1.4
        self.current_max = 1.6
        
        
        # just going to return true here since all we're doing is setting up some values
        return True

    def run_test(self) -> qc_result:
        for addr in self.readings.keys():
            try:
                self.readings[addr]["v"] = self.read_voltage(addr)
                if addr in ['0x6e', '0x6f']:
                    self.readings[addr]["i"] = self.read_current(addr, .02)
                else: 
                    self.readings[addr]["i"] = self.read_current(addr, .005)

                sleep(self.sleep_time)
            except Exception as e:
                lg.error(f"Voltage/current reading failed: {addr}")
                lg.exception(e)
                return qc_result.FAIL
            
        for a, vs in self.readings.items():
            if self.voltage_min > vs['v'] or vs['v'] > self.voltage_max:
                lg.error(f"Voltage readings outside of normal range. Sensor {a} reported a voltage of {vs['v']}.")
                return qc_result.FAIL
            if self.current_min > vs['i'] or vs['i'] > self.current_max:
                lg.error(f"Current readings outside of normal range. Sensor {a} reported a current of {vs['i']}.")
                return qc_result.FAIL
        lg.info("Voltage and current monitoring test passed.")
        return qc_result.PASS