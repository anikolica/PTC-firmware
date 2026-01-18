from ptctestsuite.test_base import test_base
from ptctestsuite import qc_result

import serial
from pythonping import ping

class gbe_test(test_base):

    def test_init(self):
        # TODO ensure serial shell is logged in - maybe do this on test suite init? Or make the tester do it
        # bring up GbE Over Serial
        serial_port = '/dev/ttyUSB0'
        baudrate = 12800
        self.ip_address = "192.168.20.112"

        try:
            with serial.Serial(port=serial_port, baudrate=baudrate, timeout=1) as ser:
                print(f"Opened {serial_port} at {baudrate} baud")
                line_end = r'\r\n'
                # assign ip address to GbE interface
                iface_str = f"ifconfig eth1 {self.ip_address} netmask 255.255.255.0{line_end}"
                ser.write(iface_str.encode('ascii'))
                # Enable GbE
                ser.write(f"poke 0xff0c0004 0x092e2c4a{line_end}".encode('ascii'))
        except:
            return False

        return True

    def run_test(self):
        try:
            response = ping(self.ip_address, verbose=True, count=3)
            print(response)
        except Exception as e:
            print(e)
            return qc_result.FAIL
        return qc_result.PASS

    def test_end(self):
        # No cleanup to do here.
        return True