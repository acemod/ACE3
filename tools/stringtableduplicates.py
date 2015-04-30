#!/usr/bin/env python3

import os
import sys

import xml.dom
from xml.dom import minidom

# STRINGTABLE DIAG TOOL
# Author: KoffeinFlummi
# ---------------------
# Counts duplicates stringtable entries


def check_module(projectpath, module):
    """ Checks the given module for all the different languages. """
    localized = []

    stringtablepath = os.path.join(projectpath, module, "stringtable.xml")
    try:
        xmldoc = minidom.parse(stringtablepath)
    except IOError:
        return 0
    keys = xmldoc.getElementsByTagName("Key")

    duplicates = 0
    for key in keys:
        children = key.childNodes
        entries = []
        for c in range(children.length):
            entries.append(children.item(c))
        entries = list(filter(lambda x: x.nodeType == x.ELEMENT_NODE, entries))
        entries = list(map(lambda x: str(x.nodeName).lower(), entries))
        diff = len(entries) - len(list(set(entries)))
        duplicates += diff
        if diff > 0:
            print(key.getAttribute("ID"))

    return duplicates

def main():
    scriptpath = os.path.realpath(__file__)
    projectpath = os.path.dirname(os.path.dirname(scriptpath))
    projectpath = os.path.join(projectpath, "addons")

    print("###############################")
    print("# Stringtable Duplicates Tool #")
    print("###############################\n")

    duplicates = 0
    for module in os.listdir(projectpath):
        d = check_module(projectpath, module)

        print("# {} {}".format(module.ljust(20), d))
        duplicates += d

    print("\nTotal number of duplicates: {}".format(duplicates))

if __name__ == "__main__":
    main()
