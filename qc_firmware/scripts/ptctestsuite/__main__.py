import prompt_toolkit as ptk
import asyncio
import json

from loguru import logger as lg

from prompt_toolkit.shortcuts import choice, message_dialog, input_dialog, confirm
from prompt_toolkit.filters import is_done

from ptctestsuite.ptctests import dummy_test
from ptctestsuite.utils import qc_result, qc_record, init_ptc
from websockets.asyncio.client import connect


lg.remove()
lg.add("ptctests.log", rotation='500MB', level="INFO")

# keeping this for the entire run of the script
tester_name = ptk.prompt("Tester Name: ")
# test sequence for automated tests goes here. This is a list of tests and their parameters
test_sequence = [
                    {"test_type": "dummy_test", "test_params": {}},
                    {"test_type": "dummy_test", "test_params": {"name": "test2"}}
                ]
# TODO list of manual tests will go here.

# for now, store these here. Can determine later if we want to go
# direct to HWDB, or store them and then upload after verification
test_runs = []

async def run_ptc_test():
    global tester_name, test_sequence 
    session = ptk.PromptSession()
    ptc_serial = await session.prompt_async("PTC Serial Number: ")

    # try to init the PTC on the default serial port
    net_status = await init_ptc()
    if not net_status:
        ptc_serial_port = await session.prompt_async("Connection failed on the default serial port. Enter a different port to attempt connection again: ", default="/dev/ttyUSB1")
        # this is kind of goofy, maybe rework this?
        net_status = await init_ptc(serial_port=ptc_serial_port)
        if not net_status:
            lg.critical("PTC Network Configuration Failed!")
            return
    
    q = qc_record(ptc_serial, tester_name)
    lg.info(f"Starting new PTC Test Session. PTC Serial is {ptc_serial}")
    # do the manual tests here
    async with connect("ws://localhost:8765") as ws:
        for t in test_sequence:
            await ws.send(json.dumps(t))
            msg = await ws.recv()
            msg = json.loads(msg)
            q.test_status[msg['test_name']] = qc_result(int(msg['test_result']))
    # or here....
    ans = await session.prompt_async("Do you want to add notes? (y/n): ")
    add_notes = ans.lower() in ('y', 'yes')
    if add_notes:
        note_text = await input_dialog(title="Notes", text="Enter tester notes here:").run_async()
        if note_text is not None:
            q.tester_notes = note_text
    test_runs.append(q)
    print(q.gen_hwdb_datasheet())

if __name__ == "__main__":
    test_again = True
    while(test_again):
        asyncio.run(run_ptc_test())
        test_again = bool(confirm("Do you want to run another test?"))
