#!/bin/python3
import os

for v in range(1, 4):
    BL = 256;
    with open('mulspeed' + str(v) + '.log', 'w') as f:
        while BL <= 8192:
            os.chdir("../")
            os.system("make -B mulspeed BITLEN=" + str(BL));
            os.chdir("test/")
            f.write(os.popen("./mulspeed").read())
            BL = BL + BL
