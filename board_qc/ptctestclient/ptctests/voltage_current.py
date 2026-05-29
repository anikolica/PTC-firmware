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

        lg.info("Starting voltage and current sensor test...")
        
        sensors = ['0x67', '0x68', '0x69', '0x6a', '0x6b', '0x6c', '0x6d', '0x6e', '0x6f']
        
        default_limits = {'v_min': 12.0, 'v_max': 12.35, 'i_min': 1.4, 'i_max': 1.6}
        
        exceptions = {
            '0x6e': {'v_min': 2.4, 'v_max': 2.6,  'i_min': 0.0, 'i_max': 2.0}, # 2.5V rail
            '0x6f': {'v_min': 3.2, 'v_max': 3.4,  'i_min': 0.0, 'i_max': 2.0}, # 3.3V rail
            '0x6d': {'v_min': 12.0, 'v_max': 12.35, 'i_min': 1.4, 'i_max': 1.6} # SoM Sensor
        }
        
        self.limits = {a: exceptions.get(a, default_limits) for a in sensors}
        self.readings = {a: {'v': 0.0, 'i': 0.0} for a in sensors}
        self.sleep_time = 0.1
        
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
            lim = self.limits[a]
            if vs['v'] < lim['v_min'] or vs['v'] > lim['v_max']:
                lg.error(f"Voltage out of range on {a}: {vs['v']}V")
                return qc_result.FAIL
            if vs['i'] < lim['i_min'] or vs['i'] > lim['i_max']:
                lg.error(f"Current out of range on {a}: {vs['i']}A")
                return qc_result.FAIL

        lg.info("Voltage and current monitoring test passed.")
        return qc_result.PASS