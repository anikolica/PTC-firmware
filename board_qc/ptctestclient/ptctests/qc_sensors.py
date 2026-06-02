import os
from time import sleep
from loguru import logger as lg

from ptctestclient.utils import test_base, qc_result

class qc_sensors_test(test_base):
    
    def test_init(self) -> bool:
        lg.info("Starting QC sensor test...")


        self.mux_map = {
            # mux address : sensor address
            '0x70': '0x6c',
            '0x71': '0x6b',
            '0x72': '0x6a',
            '0x73': '0x69',
            '0x74': '0x68',
            '0x75': '0x67'
        }

        self.RESISTOR = 0.005
        
        default_limits = {'v_min': 12, 'v_max': 12.35, 'i_min': 1.4, 'i_max': 1.6}
        self.limits = {mux: default_limits for mux in self.mux_map}
        self.readings = {mux: {'v': 0.0, 'i': 0.0} for mux in self.mux_map}
        self.sleep_time = 0.1

        self.RST_PIN = 17

        return True

    def reset_mux_bus(self):
        try:
            # Pull low, hold for 1us (> 5ns tWL(rst) min from ds), release high, exit
            os.popen(f'gpioset -t 1us,0 gpiochip0 {self.rst_gpio}=0').read()
            sleep(0.001)  
        except Exception as e:
            lg.error("Failed to toggle BP_I2C_RESET")
            lg.exception(e)

    def open_mux_channel(self, mux_addr, channel=0):
        try:
            os.popen(f'i2cset -y 2 {mux_addr} {hex(1 << channel)}').read()
        except Exception as e:
            lg.error(f"Failed to open channel {channel} on mux {mux_addr}")
            lg.exception(e)

    def close_mux(self, mux_addr):
        try:
            os.popen(f'i2cset -y 2 {mux_addr} 0x00').read()
        except Exception as e:
            lg.error(f"Failed to close mux {mux_addr}")
            lg.exception(e)

    def read_voltage(self, sensor_addr):
        try:
            i2c_raw = os.popen(f'i2cget -y 2 {sensor_addr} 0x1e w').read()
            i2c_dec = ((int(i2c_raw[4:6], 16) << 8) + int(i2c_raw[2:4], 16)) >> 4
            voltage = i2c_dec * 0.025
            return voltage
        except Exception as e:
            lg.error(f"Voltage reading failed for sensor {sensor_addr}")
            lg.exception(e)
            return None

    def read_current(self, sensor_addr, resistor):
        try:
            i2c_raw = os.popen(f'i2cget -y 2 {sensor_addr} 0x14 w').read()
            i2c_dec = ((int(i2c_raw[4:6], 16) << 8) + int(i2c_raw[2:4], 16)) >> 4
            current = i2c_dec * 0.000025 / resistor
            return current
        except Exception as e:
            lg.error(f"Current reading failed for sensor {sensor_addr}")
            lg.exception(e)
            return None
        



    def run_test(self) -> qc_result:

        self.reset_mux_bus()

        for mux_addr, sensor_addr in self.mux_map.items():
            try:
                self.open_mux_channel(mux_addr, channel=0)
                sleep(0.05)  # let bus settle after switching

                self.readings[mux_addr]['v'] = self.read_voltage(sensor_addr)
                self.readings[mux_addr]['i'] = self.read_current(sensor_addr, self.RESISTOR)

                sleep(self.sleep_time)

            except Exception as e:
                lg.error(f"Reading failed on mux {mux_addr} --> sensor {sensor_addr}")
                lg.exception(e)
                return qc_result.FAIL

            finally:
                self.close_mux(mux_addr)

        for mux_addr, vals in self.readings.items():
            lim = self.limits[mux_addr]

            if vals['v'] is None or vals['i'] is None:
                lg.error(f"Null reading on mux {mux_addr}")
                return qc_result.FAIL

            if vals['v'] < lim['v_min'] or vals['v'] > lim['v_max']:
                lg.error(f"Voltage out of range on mux {mux_addr}: {vals['v']}V")
                return qc_result.FAIL

            if vals['i'] < lim['i_min'] or vals['i'] > lim['i_max']:
                lg.error(f"Current out of range on mux {mux_addr}: {vals['i']}A")
                return qc_result.FAIL

        lg.info("QC sensor test passed.")
        return qc_result.PASS