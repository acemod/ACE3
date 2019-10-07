#!/usr/bin/env python3

import fnmatch
import os
import re
import ntpath
import sys
import argparse

import ctypes

#from http://stackoverflow.com/a/3429034
#Get required functions, strcpy..
strcpy = ctypes.cdll.msvcrt.strcpy
ocb = ctypes.windll.user32.OpenClipboard    #Basic Clipboard functions
ecb = ctypes.windll.user32.EmptyClipboard
gcd = ctypes.windll.user32.GetClipboardData
scd = ctypes.windll.user32.SetClipboardData
ccb = ctypes.windll.user32.CloseClipboard
ga = ctypes.windll.kernel32.GlobalAlloc    # Global Memory allocation
gl = ctypes.windll.kernel32.GlobalLock     # Global Memory Locking
gul = ctypes.windll.kernel32.GlobalUnlock
GMEM_DDESHARE = 0x2000

def Get( ):
  ocb(None) # Open Clip, Default task
  pcontents = gcd(1) # 1 means CF_TEXT.. too lazy to get the token thingy ...
  data = ctypes.c_char_p(pcontents).value
  #gul(pcontents) ?
  ccb()
  return data

def Paste( data ):
  ocb(None) # Open Clip, Default task
  ecb()
  hCd = ga( GMEM_DDESHARE, len( bytes(data,"ascii") )+1 )
  pchData = gl(hCd)
  strcpy(ctypes.c_char_p(pchData),bytes(data,"ascii"))
  gul(hCd)
  scd(1,hCd)
  ccb()


def getFunctions(filepath):
    selfmodule = (re.search('addons[\W]*([_a-zA-Z0-9]*)', filepath)).group(1)
    # print("Checking {0} from {1}".format(filepath,selfmodule))

    with open(filepath, 'r') as file:
        content = file.read()

        srch = re.compile('[^E]FUNC\(([_a-zA-Z0-9]*)\)')
        modfuncs = srch.findall(content)
        modfuncs = sorted(set(modfuncs))

        srch = re.compile('EFUNC\(([_a-zA-Z0-9]*),([_a-zA-Z0-9]*)\)')
        exfuncs = srch.findall(content)
        exfuncs = sorted(set(exfuncs))

    fileFuncs = []
    for func in modfuncs:
        fileFuncs.append("ace_{0}_fnc_{1}".format(selfmodule,func))

    for exModule,func in exfuncs:
        fileFuncs.append("ace_{0}_fnc_{1}".format(exModule, func))

    return fileFuncs


def getStrings(filepath):
    selfmodule = (re.search('addons[\W]*([_a-zA-Z0-9]*)', filepath)).group(1)
    # print("Checking {0} from {1}".format(filepath,selfmodule))

    with open(filepath, 'r') as file:
        content = file.read()

        srch = re.compile('[^E][CL]STRING\(([_a-zA-Z0-9]*)\)')
        modStrings = srch.findall(content)
        modStrings = sorted(set(modStrings))

        srch = re.compile('E[CL]STRING\(([_a-zA-Z0-9]*),([_a-zA-Z0-9]*)\)')
        exStrings = srch.findall(content)
        exStrings = sorted(set(exStrings))

    fileStrings = []
    for localString in modStrings:
        fileStrings.append("STR_ACE_{0}_{1}".format(selfmodule, localString))

    for (exModule, exString) in exStrings:
        fileStrings.append("STR_ACE_{0}_{1}".format(exModule, exString))

    return fileStrings

def main():

    print("#########################")
    print("# All Functions  #")
    print("#########################")

    sqf_list = []

    allFunctions = []
    allStrings = []

    parser = argparse.ArgumentParser()
    parser.add_argument('-m','--module', help='only search specified module addon folder', required=False, default=".")
    args = parser.parse_args()

    for root, dirnames, filenames in os.walk('../addons' + '/' + args.module):
      for filename in fnmatch.filter(filenames, '*.sqf'):
        sqf_list.append(os.path.join(root, filename))
      for filename in fnmatch.filter(filenames, '*.cpp'):
        sqf_list.append(os.path.join(root, filename))
      for filename in fnmatch.filter(filenames, '*.hpp'):
        sqf_list.append(os.path.join(root, filename))

    for filename in sqf_list:
        allFunctions = allFunctions + getFunctions(filename)
    for filename in sqf_list:
        allStrings = allStrings + getStrings(filename)


    codeHeader = "diag_log text '*********** Scaning for nil functions [funcs {0} / strings {1}]';".format(len(set(allFunctions)), len(set(allStrings)))
    codeFuncCheck = "{ if (isNil _x) then {systemChat format ['%1 is nil', _x]; diag_log text format ['%1 is nil', _x];}} forEach allFunctions;"
    codeStringCheck = "{ if (!isLocalized _x) then {systemChat format ['%1 is not in stringtable', _x]; diag_log text format ['%1 is not in stringtable', _x];}} forEach allStrings;"

    outputCode = "{0} allFunctions = {1}; allStrings = {2}; {3} {4}".format(codeHeader, list(set(allFunctions)), list(set(allStrings)), codeFuncCheck, codeStringCheck)

    print(outputCode)
    Paste(outputCode);

    print ("")
    print ("Copied to clipboard, [funcs {0} / strings {1}]'".format(len(set(allFunctions)), len(set(allStrings))))

if __name__ == "__main__":
    main()
