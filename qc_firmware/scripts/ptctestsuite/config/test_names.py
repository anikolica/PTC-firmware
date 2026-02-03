# dict of pretty print test names

test_pretty_names = {
    "eeprom": "EEPROM",
    "temperature_test": "Temperature",
    "gbe_test": "GBe",
    "dummy_test": "Dummy",
    "dummy_client": "Dummy Client"
}

#manual_tests = ['visual', 'ripple_hw', 'ripple_adc', 'bootup',
#                'uc_jtag', 'assert_addr', 'led_visual', 'temp_burn'
#

def man_test(name: str, message: str):
    return {"test_name": name, "test_message": message}

manual_tests = [
    man_test("example_manual", "Example manual test")
]

test_sequence = [
                    {"test_type": "dummy_test", "test_params": {}},
                    {"test_type": "dummy_test", "test_params": {"name": "test2"}}
                ]