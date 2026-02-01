import asyncio
import websockets
import json
from ptctestclient.utils import qc_result

async def send_test_result(websocket: websockets.ClientConnection, test_name: str, test_result: qc_result):
    msg = {"test_name": test_name, "test_result": test_result}
    await websocket.send(json.dumps(msg))