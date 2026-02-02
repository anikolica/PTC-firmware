import asyncio
import httpx

from ptctestsuite.utils.qc_record import qc_record
from ptctestsuite.utils.qc_result import qc_result

# rolling my own implementation for the HWDB here, since I see no need to pull in the entire library
# for what we need to do
# plus, I will have to write my own code to massage my own structures into the HWDB format,
# so might as well take the extra step to make a POST/GET request

# TODO take qc result or serial?
# or is hwdb indexed differently
def check_item_exists(item: qc_result) -> dict:
    return dict() 

def create_item(item: qc_result) -> dict:
    # will return response from REST api
    return dict()

def upload_test_result(item: qc_result) -> dict:
    # will return response from REST api
    return dict()

def upload_ptc_image(item: qc_result, image) -> dict:
    # will return response from REST api
    return dict()