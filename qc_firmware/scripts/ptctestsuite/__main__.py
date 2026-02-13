import prompt_toolkit as ptk
import asyncio
import json

from loguru import logger as lg

from prompt_toolkit.shortcuts import choice, message_dialog, input_dialog, confirm
from prompt_toolkit.filters import is_done

from ptctestsuite.ptctests import dummy_test
from ptctestsuite.utils import qc_result, qc_record, init_ptc, start_client, async_yesno, manual_test
from websockets.asyncio.client import connect
from ptctestsuite.config import manual_tests, test_sequence

from argparse import ArgumentParser

from ptctestsuite.config import parameters

parser = ArgumentParser()
parser.add_argument('--debug', action='store_true')

args = parser.parse_args()

lg.remove()
lg.add("ptctests.log", rotation='500MB', level="INFO")

# keeping this for the entire run of the script
tester_name = ptk.prompt("Tester Name: ")
# test sequence for automated tests goes here. This is a list of tests and their parameters


# for now, store these here. Can determine later if we want to go
# direct to HWDB, or store them and then upload after verification
test_runs = []

async def run_ptc_test():
    global tester_name, test_sequence 
    ptc_ip = "localhost" if args.debug else parameters.ptc_ip
    
    session = ptk.PromptSession()
    ptc_serial = await session.prompt_async("PTC Serial Number: ")

    # try to init the PTC on the default serial port
    net_status = await init_ptc(debug_run=args.debug)
    if not net_status:
        ptc_serial_port = await session.prompt_async("Connection failed on the default serial port. Enter a different port to attempt connection again: ", default="/dev/ttyUSB1")
        # this is kind of goofy, maybe rework this?
        net_status = await init_ptc(serial_port=ptc_serial_port, debug_run=args.debug)
        if not net_status:
            lg.critical("PTC Network Configuration Failed!")
            return
    
    # start client task
    if not args.debug:
        server_listening = asyncio.Event()
        client_task = asyncio.create_task(start_client(server_listening, debug_run=args.debug))
        try:
            lg.info("Waiting for PTC Application to Initialize....")
            await asyncio.wait_for(server_listening.wait(), timeout=20)
        except asyncio.TimeoutError:
            lg.critical("PTC Application failed to start within 20 seconds!")
            client_task.cancel()
   
    
    q = qc_record(ptc_serial, tester_name)
    lg.info(f"Starting new PTC Test Session. PTC Serial is {ptc_serial}")
    # do the manual tests here
    async with connect(f"ws://{ptc_ip}:{parameters.ws_port}") as ws:
        for t in test_sequence:
            print(f"Running {t['test_type']} with parameters {t['test_params']}")
            lg.info(f"Running {t['test_type']} with parameters {t['test_params']}")
            await ws.send(json.dumps(t))
            msg = await ws.recv()
            msg = json.loads(msg)
            q.test_status[msg['test_name']] = qc_result(int(msg['test_result']))
    
    for t in manual_tests:
        with manual_test(**t) as test:
            result = await async_yesno(session, test.message)
            q.test_status[test.test_name] = qc_result(int(result))
    # or here....
    add_notes = await async_yesno(session, "Do you want to add notes?")
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
