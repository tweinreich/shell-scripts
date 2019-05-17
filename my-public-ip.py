#!/usr/bin/env python3
"""Get your public ipv4 and ipv6"""

import requests
import json


IPV4_URL = "https://test-ipv6.com/ip/?callback=_jqjsp&asn=1&testdomain=test-ipv6.com&testname=test_asn4"
IPV6_URL ="https://ipv6.test-ipv6.ams.vr.org/ip/?callback=_jqjsp&testdomain=test-ipv6.com&testname=test_aaaa"
ENCODING = "utf-8"


def run():
    """Main method"""
    ipv4_response = requests.get(url=IPV4_URL)
    ipv6_response = requests.get(url=IPV6_URL)

    if ipv4_response.status_code == 200 and ipv6_response.status_code == 200:
        ipv4_data = json.loads("[" + ipv4_response.content.decode(ENCODING)[7:-2] + "]")
        ipv6_data = json.loads("[" + ipv6_response.content.decode(ENCODING)[7:-2] + "]")
        print("### Your public IP ###")
        print("IPv4: " + ipv4_data[0]['ip'])
        print("IPv6: " + ipv6_data[0]['ip'])
    else:
        print("Something went wrong, fetching your public IP. (Response Status Code is not 200 'OK')")


run()
