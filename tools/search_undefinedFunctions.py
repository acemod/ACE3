#!/usr/bin/env python3

import fnmatch
import os
import re
import ntpath
import sys
import argparse

# handle x64 python clipboard, ref https://forums.autodesk.com/t5/maya-programming/ctypes-bug-cannot-copy-data-to-clipboard-via-python/m-p/9197068/highlight/true#M10992
import ctypes
from ctypes import wintypes
CF_UNICODETEXT = 13


user32 = ctypes.WinDLL('user32')
kernel32 = ctypes.WinDLL('kernel32')

OpenClipboard = user32.OpenClipboard
OpenClipboard.argtypes = wintypes.HWND,
OpenClipboard.restype = wintypes.BOOL
CloseClipboard = user32.CloseClipboard
CloseClipboard.restype = wintypes.BOOL
EmptyClipboard = user32.EmptyClipboard
EmptyClipboard.restype = wintypes.BOOL
GetClipboardData = user32.GetClipboardData
GetClipboardData.argtypes = wintypes.UINT,
GetClipboardData.restype = wintypes.HANDLE
SetClipboardData = user32.SetClipboardData
SetClipboardData.argtypes = (wintypes.UINT, wintypes.HANDLE)
SetClipboardData.restype = wintypes.HANDLE
GlobalLock = kernel32.GlobalLock
GlobalLock.argtypes = wintypes.HGLOBAL,
GlobalLock.restype = wintypes.LPVOID
GlobalUnlock = kernel32.GlobalUnlock
GlobalUnlock.argtypes = wintypes.HGLOBAL,
GlobalUnlock.restype = wintypes.BOOL
GlobalAlloc = kernel32.GlobalAlloc
GlobalAlloc.argtypes = (wintypes.UINT, ctypes.c_size_t)
GlobalAlloc.restype = wintypes.HGLOBAL
GlobalSize = kernel32.GlobalSize
GlobalSize.argtypes = wintypes.HGLOBAL,
GlobalSize.restype = ctypes.c_size_t

GMEM_MOVEABLE = 0x0002
GMEM_ZEROINIT = 0x0040

def Paste( data ):
    data = data.encode('utf-16le')
    OpenClipboard(None)
    EmptyClipboard()
    handle = GlobalAlloc(GMEM_MOVEABLE | GMEM_ZEROINIT, len(data) + 2)
    pcontents = GlobalLock(handle)
    ctypes.memmove(pcontents, data, len(data))
    GlobalUnlock(handle)
    SetClipboardData(CF_UNICODETEXT, handle)
    CloseClipboard()   


def getFunctions(filepath):
    selfmodule = (re.search(r'addons[\W]*([_a-zA-Z0-9]*)', filepath)).group(1)
    # print("Checking {0} from {1}".format(filepath,selfmodule))

    with open(filepath, 'r') as file:
        content = file.read()

        srch = re.compile(r'[^E]FUNC\(([_a-zA-Z0-9]*)\)')
        modfuncs = srch.findall(content)
        modfuncs = sorted(set(modfuncs))

        srch = re.compile(r'EFUNC\(([_a-zA-Z0-9]*),([_a-zA-Z0-9]*)\)')
        exfuncs = srch.findall(content)
        exfuncs = sorted(set(exfuncs))

    fileFuncs = []
    for func in modfuncs:
        fileFuncs.append("ace_{0}_fnc_{1}".format(selfmodule,func))

    for exModule,func in exfuncs:
        fileFuncs.append("ace_{0}_fnc_{1}".format(exModule, func))

    return fileFuncs


def getStrings(filepath):
    selfmodule = (re.search(r'addons[\W]*([_a-zA-Z0-9]*)', filepath)).group(1)
    # print("Checking {0} from {1}".format(filepath,selfmodule))

    with open(filepath, 'r') as file:
        content = file.read()

        srch = re.compile(r'[^E][CL]STRING\(([_a-zA-Z0-9]*)\)')
        modStrings = srch.findall(content)
        modStrings = sorted(set(modStrings))

        srch = re.compile(r'E[CL]STRING\(([_a-zA-Z0-9]*),([_a-zA-Z0-9]*)\)')
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
    Paste(outputCode)

    print ("")
    print ("Copied to clipboard, [funcs {0} / strings {1}]'".format(len(set(allFunctions)), len(set(allStrings))))

if __name__ == "__main__":
    main()
