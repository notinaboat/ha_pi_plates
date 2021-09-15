#!/usr/bin/python3

import piplates.RELAYplate as RELAY
import sys
import os
import errno
import time

FIFO = "/var/run/relay_server"

try:
    os.mkfifo(FIFO)
except OSError as oe:
    if oe.errno != errno.EEXIST:
        raise

os.chmod(FIFO, 0o0666)

RELAY.relayALL(0, 0)
RELAY.relayALL(1, 0)

print("FIFO Server on /var/run/relay_server")
while True:
    with open(FIFO) as fifo:
        while True:
            data = fifo.readline()
            print(data)
            if len(data) == 0:
                break
            f, a, b = data.rstrip().split(",")
            a = int(a)
            b = int(b)
            if f == "press":
                RELAY.relayOFF(a, b)
                time.sleep(0.1)  
                RELAY.relayON(a, b)
                time.sleep(0.2)  
                RELAY.relayOFF(a, b)
            else:
                getattr(RELAY, f)(a, b)
