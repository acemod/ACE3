#!/usr/bin/env python3
"""
Author: SilentSpike
Crawl function headers to produce appropriate documentation of public functions.

Supported header sections:
 - Author(s) (with description below)
 - Arguments
 - Return Value
 - Example(s)
 - Public (by default function will only be documented if set to "Yes")

EXAMPLES
    document_functions common --debug
        Crawl only functions in addons/common and only reports debug messages.
"""

import os
import sys
import re
import argparse

def document_public():
    return

def read_func(code, debug=False):
    header = re.match(r"\s*/\*.+?\*/", code, re.S)
    if header:
        sections = re.split(r"^\s\*\s+(Author|Argument|Return Value|Example|Public)s?:\s?", header.group(), 0, re.I|re.M)

        try:
            public_value = re.match(r"(Yes|No)", sections[sections.index("Public") + 1], re.I)

            if public_value:
                is_public = public_value.group().lower() == "yes"
            else:
                return "Invalid \"Public\" header value"
        except ValueError:
            return "Missing \"Public\" header value"

        if is_public and not debug:
            document_public(sections)
            return "Processed"
    else:
        return "Invalid header"

    return ""

def crawl_dir(directory, debug=False):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".sqf") and file.startswith("fnc_"):
                file_path = os.path.join(root, file)

                with open(file_path) as f:
                    output = read_func(f.read(), debug)

                    if output:
                        print("{0}: {1}".format(output, os.path.relpath(file_path, directory)))

def main():
    print("""
    #########################
    # Documenting Functions #
    #########################
    """)

    parser = argparse.ArgumentParser()
    parser.add_argument('directory', nargs="?", type=str, default=".", help='only crawl specified module addon folder')
    parser.add_argument('--debug', action="store_true", help='only check for header debug messages')
    args = parser.parse_args()

    # abspath is just used for the terminal output
    prospective_dir = os.path.abspath(os.path.join('../../addons/',args.directory))
    if os.path.isdir(prospective_dir):
        print("Processing: {}".format(prospective_dir))
        crawl_dir(prospective_dir, args.debug)
    else:
        print("Invalid directory: {}".format(prospective_dir))

if __name__ == "__main__":
    main()
