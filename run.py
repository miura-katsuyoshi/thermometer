"""
Testbench of thermometer.sv
------------------------
usage: ./run.py
"""

import os
import subprocess
from vunit.verilog import VUnit

if not os.path.isdir("tb"):
    os.mkdir("tb")
for width in (2,3,4,5,6,7,8):
    subprocess.run("sed -e 's/%WIDTH%/{}/' thermometer_tb.sv > tb/thermometer{}_tb.sv".format(width,width), shell=True);

VU = VUnit.from_argv()
lib = VU.add_library("lib");

# Design
lib.add_source_files("thermometer.sv")

# Testbench
lib.add_source_files("tb/*.sv")

VU.main()
