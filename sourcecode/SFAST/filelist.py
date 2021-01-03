#!/usr/bin/env python3

from os import listdir
from os.path import isfile, join
import sys

mypath = "/Users/liumin/Desktop/SFAST"
print(mypath)
onlyfiles = [f for f in listdir(mypath) if isfile (join(mypath, f))]
print(onlyfiles)
for i in onlyfiles:
    print("analyze -library WORK -format verilog {/home/inichang/minliu_icdesign/sourcecode/SFAST/"+i+"}")
