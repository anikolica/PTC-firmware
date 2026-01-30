import prompt_toolkit as ptk
from time import sleep

from loguru import logger as lg

from prompt_toolkit.shortcuts import choice, message_dialog, input_dialog
from prompt_toolkit.filters import is_done

from .ptctests import dummy_test

lg.remove()
lg.add("ptctests.log", rotation='500MB', level="INFO")

# keeping this for the entire run of the script
tester_name = ptk.prompt("Tester Name: ")

def run_ptc_test():
    global tester_name 
    session = ptk.PromptSession()
    ptc_serial = session.prompt("PTC Serial: ")
    lg.info(f"Starting new PTC Test Session. PTC Serial is {ptc_serial}")
    print("Running an example test.....")
    with dummy_test("a") as t:
        t.run_test()
    with dummy_test("b") as t:
        t.run_test()
    

if __name__ == "__main__":
    run_ptc_test()