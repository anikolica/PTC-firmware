import os
from time import sleep
from loguru import logger as lg

from ptctestclient.utils import test_base, qc_result


class voltage_curr_test(test_base):
    
    def read_voltage(self, addr):
        """Reads i2c volage bits from the iv sensor, 
                    parses into decimal, and calculates voltage
        
        Args:
            sensor_addr (str): hex address of the iv sensor

        Returns:
            voltage (float): voltage reading in volts
        """

        try:
            i2c_raw = os.popen('i2cget -y 0 ' + addr + ' 0x1e w').read()
            i2c_dec =((int((i2c_raw)[4:6], 16) << 8) + int((i2c_raw)[2:4], 16)) >> 4
            voltage = i2c_dec * 0.025
            return voltage
        except ValueError as e:
            lg.error(f"Voltage reading failed for sensor {addr}")
            lg.exception(e)
            return None
    
    def read_current(self, addr, resistor):
        """Reads i2c current bits from the iv sensor, 
            parses into decimal, and calculates current

        Args:
        sensor_addr (str): hex address of the iv sensor
        resistor (float): resistance value for current calculation

        Returns:
        current (float): current reading in amps
        """

        try:
            i2c_raw = os.popen('i2cget -y 0 ' + addr + ' 0x14 w').read()
            i2c_dec =((int((i2c_raw)[4:6], 16) << 8) + int((i2c_raw)[2:4], 16)) >> 4
            current = i2c_dec * 0.000025 / resistor
            return current
        except ValueError as e:
            lg.error(f"Current reading failed for sensor {addr}")
            lg.exception(e)
            return None
        
 
    def test_init(self) -> bool:
        """initialize the test, sensor addreses, 
        and respective ranges with exceptions for aux and SoM sensors

        Returns:
            bool: successful init
        """

        lg.info("Starting voltage and current sensor test...")
        
        sensors = ['0x67', '0x68', '0x69', '0x6a', '0x6b', '0x6c', '0x6d']
        aux_sensors = ['0x6e', '0x6f'] 

        default_limits = {'v_min': 12.0, 'v_max': 12.35, 'i_min': 1.35, 'i_max': 1.65} # review current bounds
        exceptions = {
            '0x6d': {'v_min': 12.0, 'v_max': 12.35, 'i_min': 0, 'i_max': 2}, # SoM Sensor
            '0x6e': {'v_min': 2.4, 'v_max': 2.6,  'i_min': 0.5, 'i_max': 2.0}, # 2.5V rail +- .1V
            '0x6f': {'v_min': 3.2, 'v_max': 3.4,  'i_min': 0.5, 'i_max': 2.0} # 3.3V rail +- .1V
 
        }
        
        all_sensors = sensors + aux_sensors                                     
        self.limits = {a: exceptions.get(a, default_limits) for a in all_sensors}  
        self.readings = {a: {'v': 0.0, 'i': 0.0} for a in all_sensors}  
        self.sleep_time = 0.1
        


    def run_test(self) -> qc_result:
        """iterates through the muxes and associated iv sensors, 
        reads voltage and current, and evaluates if they are within the acceptable range. 

        Returns:
            qc_result: pass or fail based on the readings/ranges
        """
        
        # from ecat test 1b - repeated 
        module = '5EV'
        if module == '2EG':
            base_addr = '0xa003'
        else:
            base_addr = '0x8002'

        os.system('poke ' + base_addr + '0000 0x00000201')
        # Taking I2C switches out of reset'
        sleep(1)

        
        for addr in self.readings.keys():
            try:
                self.readings[addr]["v"] = self.read_voltage(addr)
                if addr in ['0x6e', '0x6f']: 
                    # change to aux sensor channel from mux
                    os.system('i2cset -y -r 0 0x70 0x04')
                    sleep(1)

                    self.readings[addr]["i"] = self.read_current(addr, .02)
                
                else: 
                    os.system('i2cset -y -r 0 0x70 0x08')
                    sleep(1)
    
                    self.readings[addr]["i"] = self.read_current(addr, .005)

                sleep(self.sleep_time)
            except OSError as e:
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