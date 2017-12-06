#!/usr/bin/env python3

#by PabstMirror - python script to verify all addons using MakePbo's lint checking and extFile Checking
#Arguments (eg: `config_validator.py full`):
#full        dump full deRaped config of problem
#skipExt     skips checking external file references

import os
import sys
import subprocess
import timeit
import time

######## GLOBALS #########
MAINPREFIX = "Z"
PREFIX = "ACE"
##########################

def Fract_Sec(s):
    temp = float()
    temp = float(s) / (60*60*24)
    d = int(temp)
    temp = (temp - d) * 24
    h = int(temp)
    temp = (temp - h) * 60
    m = int(temp)
    temp = (temp - m) * 60
    sec = temp
    return d,h,m,sec

def CheckPBO(p,useMakePbo,checkExternalFiles,errors):
    try:
        if useMakePbo:
            makePboArgs = "-PGU"
            if not checkExternalFiles:
                makePboArgs = "-PU"
            subprocess.run([
                "makepbo",
                makePboArgs,
                "-@={}\\{}\\addons\\{}".format(MAINPREFIX,PREFIX.rstrip("_"),p),
                p,
                "{}_{}.pbo".format(PREFIX,p)
            ], stdin=None, input=None, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
        else:              
            makePboArgs = "-LEP"
            if not checkExternalFiles:
                makePboArgs = "-LP"
            subprocess.run([
                "rapify",
                makePboArgs,
                p
            ], stdin=None, input=None, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
            
    except subprocess.CalledProcessError as e:
        print("!! Problem With {} ret {} !!".format(p, e.returncode))
        print("     stderr: {}".format(e.stderr))
        errors.append(p)
    else:
        print("  Checked ok {}".format(p))
    return

def fullDump(p):
    try:
        subprocess.run([
            "makepbo",
            "-PGUS",  #G Check external references -S show deRap - P dont pause
            "-@={}\\{}\\addons\\{}".format(MAINPREFIX,PREFIX.rstrip("_"),p),
            p,
            "{}_{}.pbo".format(PREFIX,p)
        ], stdin=None, input=None, check=True)
    except subprocess.CalledProcessError as e:
        input("Press Enter to continue...")
    return

def main(argv):
    print("""
  ####################
  # ACE3 Config Check #
  ####################
""")

    start_time = timeit.default_timer()

    addonspath = os.path.join("P:\\",MAINPREFIX,PREFIX,"addons")

    print("Switching to dir: {}".format(addonspath))
    try:
        os.chdir(addonspath)
    except:
        raise Exception("Failed to switch to addon dir on P:")

    useMakePbo = False
    checkExternalFiles = True
    
    if "skipExt" in argv:
        print("Skipping External Files Check");
        checkExternalFiles = False
    if "make" in argv:
        # will check more files like RTM and RVMats but twice as slow
        # This also actually builds a pbo (in same spot as build.py)
        print("Using makePbo to verify all files");
        useMakePbo = True

    errors = []

    for p in os.listdir(addonspath):
        path = os.path.join(addonspath, p)
        if not os.path.isdir(path):
            continue
        if p[0] == ".":
            continue
        CheckPBO(p,useMakePbo,checkExternalFiles,errors)


    d,h,m,s = Fract_Sec(timeit.default_timer() - start_time)
    print("\n# Done with {0} errrors [took: {1:2}h {2:2}m {3:4.5f}s]".format(len(errors),h,m,s))

    if (len(errors) > 0):
        if "full" in argv:
            input("Dumping Full DeRap: Press Enter to continue...")
            for p in errors:
                fullDump(p)
        else:
            print("use 'full' arg to show derap")

    ret = len(errors)
    print("return {}".format(ret))
    return ret

if __name__ == "__main__":
    main(sys.argv)
