##
# @file Magical.py
# @author Keren Zhu
# @date 06/27/2019
# @brief Main file to run the Magical hierarchical flow
#

import os
import sys
import time
import Params, MagicalDB, Flow

class Magical(object):
    def __init__(self, jsonFile):
        self.params = Params.Params()
        self.params.load(jsonFile)
        self.db = MagicalDB.MagicalDB(self.params) # The flow database
        self.db.parse() #parsing the input files
        self.flow = Flow.Flow(self.db)

    def run(self):
        self.flow.run()

if __name__ == "__main__":
    """
    @brief main function to invoke the entire Magical flow
    """

    start_t = time.time()

    params = Params.Params()
    params.printWelcome()
    if len(sys.argv) == 1 or '-h' in sys.argv[1:] or '--help' in sys.argv[1:]:
        params.printHelp()
        exit()
    elif len(sys.argv) != 2:
        print("[E] One input parameters in json format in required")
        params.printHelp()
        exit()

    # load parameters 
    params.load(sys.argv[1])
    print("[I] parameters = %s" % (params))

    start = time.time()
    db = MagicalDB.MagicalDB(params) # The flow database
    end = time.time()
    io_time = end - start

    db.parse() #parsing the input files

    start = time.time()
    flow = Flow.Flow(db)
    flow.run()
    end = time.time()

    print("IO Time ", io_time )
    print("PNR FLOW Time ", end - start)

    end_t = time.time()
    print("WHOLE Time ", end_t - start_t)


#Workaround for Pyinstaller. ref:https://github.com/pyinstaller/pyinstaller/issues/2820
if 0:
    import UserList
    import UserString
    import UserDict
    import itertools
    import collections
    import future.backports.misc
    import commands
    import base64
    import __buildin__
    import math
    import reprlib
    import functools
    import re
    import subprocess
