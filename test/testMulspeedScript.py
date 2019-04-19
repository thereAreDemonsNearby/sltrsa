#!/bin/python3
import os

#for v in range(1, 4):
v=1
BL = 512;
with open('mulspeed_' + str(v) + '.log', 'w') as f:
    while BL <= 4096:
        os.chdir("../")
        os.system("make -B mulspeed BITLEN=" + str(BL));
        os.chdir("test/")
        f.write(os.popen("./mulspeed").read())
        BL = BL + BL
