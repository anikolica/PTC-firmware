# dict of pretty print test names

test_pretty_names = {
    "eeprom": "EEPROM",
    "temperature_test": "Temperature",
    "gbe_test": "GBe",
    "dummy_test": "Dummy",
    "dummy_client": "Dummy Client",
    "qc_sensors_test": "QC Board Sensors"
}

#manual_tests = ['visual', 'ripple_hw', 'ripple_adc', 'bootup',
#                'uc_jtag', 'assert_addr', 'led_visual', 'temp_burn'
#

def man_test(name: str, message: str, accepts_val: bool = False):
    return {"test_name": name, "test_message": message, "accepts_value": accepts_val}

# these all get repeated so let's write a function to generate them, in case we
# have to change anything
def ripple_test(num: int):
    return man_test(f'ripple{num}', f'RIPPLE_{num} Voltage Reading', True)

def ripple_switch_freq(num: int):
    return man_test(f'ripple{num}_switch_freq', f"RIPPLE_{num} Switching Frequency", True)

def wib_led(num: int):
    return man_test(f'wib{num}_led', f"WIB{num} Front Panel LED", False)

"""
manual_tests = [
    man_test("example_manual", "Example manual test", True),
    man_test("bare_power", "Power consumption without SoM", True),
    man_test("vp12_local", "VP12_LOCAL Voltage Reading", True),
    man_test("local_led_12v", "VP12_LOCAL LED On/Off", False),
    ripple_test(0),
    ripple_switch_freq(0), 
    wib_led(0),
    ripple_test(1),
    ripple_switch_freq(1), 
    wib_led(1),
    ripple_test(2),
    ripple_switch_freq(2), 
    wib_led(2),
    ripple_test(3),
    ripple_switch_freq(3), 
    wib_led(3),
    ripple_test(4),
    ripple_switch_freq(4), 
    wib_led(4),
    ripple_test(5),
    ripple_switch_freq(5), 
    wib_led(5),
]
"""
manual_tests = [man_test('dummy_man', 'Dummy Test', True)]

# need to scan the enclustra QR in between here to track the serial number

"""
manual_test_phase_2 = [
    man_test("som_insertion", "Enclustra SoM Insertion Good? NOTE CONNECTOR KEYING", False),
    man_test('12v_local_led_boot', "Is the 12V_LOCAL LED Illuminated?", False),
    man_test('pg_led_boot', "Is the PG LED Illuminated?", False),
    man_test('fpga_done_led_boot', "Is the FPGA_DONE LED Illuminated?", False),
    # NOTE this test can be an automatic test
    #man_test('serial_connection', "Serial Connection Good?", False),
    man_test('repeat_boots', "Repeat Bootup 5 times. Did it succeed each time?", False)
]
"""
manual_test_phase_2 = [man_test('dummy_man_p2', "Dummy Phase 2", False)]

test_sequence = [
                    {"test_type": "dummy_test", "test_params": {}},
                    {"test_type": "dummy_test", "test_params": {"name": "test2"}}
                ]