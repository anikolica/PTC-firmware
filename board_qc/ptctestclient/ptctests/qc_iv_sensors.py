"""Test script that runs on the PTC to read the IV sensors
located on the QC board for monitoring purposes.
"""

import subprocess
from dataclasses import dataclass
from subprocess import CalledProcessError
from time import sleep
from loguru import logger as lg


from ptctestclient.utils import test_base, qc_result


@dataclass
class IVSensorChannel:  # pylint: disable=too-many-instance-attributes
    """A single IV sensor channel behind a mux on the QC board."""
    mux_addr: str
    sensor_addr: str
    v_min: float
    v_max: float
    i_min: float
    i_max: float
    voltage: float | None = 0.0
    current: float | None = 0.0


class qc_sensors_test(test_base): # pylint: disable=invalid-name
    """Test script that runs on the PTC to read the IV sensors
    located on the QC board for monitoring purposes.
    """

    def __init__(self):
        self.channels = []
        self.sleep_time = 0.1
        super().__init__()

    def test_init(self) -> bool:
        """Initialize the mux and iv sensor addresses, and acceptance ranges

        Returns:
            bool: successful initialization 
        """
        lg.info("Starting QC sensor test...")

        self.channels = [
            # (mux_addr, sensor_addr, v_min, v_max, i_min, i_max)
            IVSensorChannel('0x70', '0x6c', 12, 12.35, 1.4, 1.6),
            IVSensorChannel('0x71', '0x6b', 12, 12.35, 1.4, 1.6),
            IVSensorChannel('0x72', '0x6a', 12, 12.35, 1.4, 1.6),
            IVSensorChannel('0x73', '0x69', 12, 12.35, 1.4, 1.6),
            IVSensorChannel('0x74', '0x68', 12, 12.35, 1.4, 1.6),
            IVSensorChannel('0x75', '0x67', 12, 12.35, 1.4, 1.6),
        ]
        self.sleep_time = 0.1

        return True


    def reset_mux_bus(self):
        """Resets the mux. As of testing (July/August 2026), the QC board 
            does not have the reset pin connected for hardware debugging.
        """
        # Reset pin is not wired in the current hardware revision.
        lg.warning("Reset pin not yet wired in hardware.")
        rst_pin = -1

        # has register - set high
        try:
            # Pull low, hold for 1us (> 5ns tWL(rst) min from ds), release high, exit
            subprocess.run(
                ['gpioset', '-t', '1us,0', 'gpiochip0', f"{rst_pin}=0"],
                check=True
            )
            sleep(0.001)
        except CalledProcessError as e:
            lg.error("Failed to toggle BP_I2C_RESET")
            lg.exception(e)


    def open_mux_channel(self, mux_addr, channel=0):
        """Opens the mux to access the associated sensors.

        Args:
            mux_addr (str): mux hex address
            channel (int, optional): each mux has 8 channels to switch, 
                                     defaults to 0 for the hardware setup 
                                     (all QC IV sensors are wired on channel 1)
        """

        try:
            subprocess.run(
                ["i2cset", "-y", "2", str(mux_addr), hex(1 << channel)],
                check=True
            )
        except CalledProcessError as e:
            lg.error(f"Failed to open channel {channel} on mux {mux_addr}")
            lg.exception(e)


    def close_mux(self, mux_addr):
        """Closes the mux after completing the I2C read.

        Args:
            mux_addr (str): mux hex address
        """

        try:
            subprocess.run(
                ["i2cset", "-y", "2", str(mux_addr), "0x00"],
                check=True
            )
        except CalledProcessError as e:
            lg.error(f"Failed to close mux {mux_addr}")
            lg.exception(e)


    def read_voltage(self, sensor_addr):
        """Reads the I2C voltage bits from the IV sensor, 
            parses them into decimal, and calculates the voltage.

        Args:
            sensor_addr (str): hex address of the iv sensor

        Returns:
            voltage (float): voltage reading in volts
        """

        try:
            i2c_raw_cmd = subprocess.run(
                ['i2cget', '-y', '2', str(sensor_addr), '0x1e', 'w'],
                check=True,
                capture_output=True,
                text=True
            )
            i2c_raw = i2c_raw_cmd.stdout
            i2c_dec = ((int(i2c_raw[4:6], 16) << 8) + int(i2c_raw[2:4], 16)) >> 4
            voltage = i2c_dec * 0.025
            return voltage
        except CalledProcessError as e:
            lg.error(f"Voltage reading failed for sensor {sensor_addr}")
            lg.exception(e)
            return None
        except ValueError as e:
            lg.error(f"Invalid voltage reading from sensor {sensor_addr}")
            lg.exception(e)
            return None

    def read_current(self, sensor_addr):
        """Reads the I2C current bits from the IV sensor, 
            parses them into decimal, and calculates the current.

        Args:
            sensor_addr (str): hex address of the iv sensor
            resistor (float): resistance value for current calculation

        Returns:
            current (float): current reading in amps
        """

        sense_voltage_lsb = 0.000025
        resistor = 0.005

        try:
            i2c_raw_cmd = subprocess.run(
                ["i2cget", "-y", "2", str(sensor_addr), "0x14", "w"],
                check=True,
                capture_output=True,
                text=True
            )
            i2c_raw = i2c_raw_cmd.stdout
            i2c_dec = ((int(i2c_raw[4:6], 16) << 8) + int(i2c_raw[2:4], 16)) >> 4
            current = i2c_dec * sense_voltage_lsb / resistor
            return current
        except CalledProcessError as e:
            lg.error(f"Failed to read current for sensor {sensor_addr}")
            lg.exception(e)
            return None
        except ValueError as e:
            lg.error(f"Invalid current reading from sensor {sensor_addr}")
            lg.exception(e)
            return None

    def run_test(self) -> qc_result:
        """Iterates through the muxes and associated IV sensors, 
        reads the voltage and current, and evaluates whether they are within the acceptable range.

        Returns:
            qc_result: pass or fail based on the readings/ranges
        """

        self.reset_mux_bus()

        for ch in self.channels:
            try:
                self.open_mux_channel(ch.mux_addr, channel=0)
                sleep(0.05)

                ch.voltage = self.read_voltage(ch.sensor_addr)
                ch.current = self.read_current(ch.sensor_addr)

                sleep(self.sleep_time)

            # A catch-all exception is acceptable here, as we are looking for any
            # sort of failure.
            except Exception as e:  # pylint: disable=broad-exception-caught
                # The previous functions will return more detailed errors,
                # making this error test-specific.
                lg.critical(
                    "Reading at least one voltage or current sensor"
                    " was unsuccessful! Marking test as failed"
                )
                lg.exception(e)
                return qc_result.FAIL

            finally:
                self.close_mux(ch.mux_addr)

        for ch in self.channels:
            if ch.voltage is None or ch.current is None:
                lg.error(f"Null reading on mux {ch.mux_addr}")
                return qc_result.FAIL

            if ch.voltage < ch.v_min or ch.voltage > ch.v_max:
                lg.error(f"Voltage out of range on mux {ch.mux_addr}: {ch.voltage}V")
                return qc_result.FAIL

            if ch.current < ch.i_min or ch.current > ch.i_max:
                lg.error(f"Current out of range on mux {ch.mux_addr}: {ch.current}A")
                return qc_result.FAIL

        lg.info("QC sensor test passed.")
        return qc_result.PASS
