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

class Writer:
    def __init__(self, path="", debug=False):
        self.path = path
        self.debug = debug
        self.logged = False

    def log_file(self, error=False):
        # When in debug mode we only want to see the files with errors
        if not self.debug or error:
            if not self.logged:
                self.write("Processing... {}".format(self.path), 1)
                self.logged = True

    def error(self, message):
        self.log_file(self.debug)
        self.write("Error: {}".format(message))

    def write(self, message, indent=2):
        to_print = ["  "]*indent
        to_print.append(message)
        print("".join(to_print))


def document_public():
    return

def process_author(text, writer):
    authors = text.splitlines()[0]
    description = "".join([x[3:] for x in text.splitlines(1)[1:]])
    return [authors, description]

def process_argument(argument, writer):
    if argument.startswith("None"):
        return ["","None","",""]

    definition = re.match(r"^(\d+):\s(.+)\<([\s\w]+)\>\s?(\(default: ([\w\s]+)\))?", argument);

    if definition:
        index = definition.group(1)
        name = definition.group(2)
        data_types = definition.group(3)
        default_value = definition.group(5)
    else:
        writer.error("Malformed argument")
        return ["","","",""]
    return [index, name, data_types, default_value]

def process_arguments(text, writer):
    # Remove the header characters
    arguments = [x[3:] for x in text.splitlines(1)]

    # Find lines which new arguments start on (for multi-line descriptions)
    arg_indices = [i for i, line in enumerate(arguments) if re.match(r"^\d+:", line)]

    return [process_argument(arguments[i], writer) for i in arg_indices]

def process_return(text, writer):
    # Remove header characters and only use first line
    text = text.splitlines()[0][3:]

    if text.startswith("None"):
        return ["None", ""]

    valid_value = re.match(r"^(.+)\<([\s\w]+)\>", text)

    if valid_value:
        return [valid_value.group(1), valid_value.group(2)]
    else:
        writer.error("Malformed \"Return Value\"")

    return ["", ""]

def process_example(text, writer):
    return

def read_func(code, writer):
    header = re.match(r"\s*/\*.+?\*/", code, re.S)
    if header:
        sections = re.split(r"^\s\*\s+(Author|Argument|Return Value|Example|Public)s?:\s?", header.group(), 0, re.I|re.M)

        # Check if public
        try:
            public_value = re.match(r"(Yes|No)", sections[sections.index("Public") + 1], re.I)

            if public_value:
                is_public = public_value.group().lower() == "yes"
            else:
                writer.error("Invalid \"Public\" header value")
                return
        except ValueError:
            writer.error("Missing \"Public\" header section")
            return

        # Log all functions processed
        writer.log_file()

        # Process the Author: section
        try:
            author_text = sections[sections.index("Author") + 1]
            author, description = process_author(author_text, writer)
        except ValueError:
            writer.error("Missing \"Author\" header section")
            return

        # Process the Arguments: section
        try:
            arguments_text = sections[sections.index("Argument") + 1]
            arguments = process_arguments(arguments_text, writer)
        except ValueError:
            writer.error("Missing \"Arguments\" header section")
            return

        # Process the Return Value: section
        try:
            return_text = sections[sections.index("Return Value") + 1]
            return_value = process_return(return_text, writer)
        except ValueError:
            writer.error("Missing \"Return Value\" header section")
            return

        # Process the Example: section
        try:
            example_text = sections[sections.index("Example") + 1]
            process_example(example_text, writer)
        except ValueError:
            writer.error("Missing \"Example\" header section")
            return
    else:
        writer.error("Invalid header")

    return

def crawl_dir(directory, debug=False):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".sqf") and file.startswith("fnc_"):
                file_path = os.path.join(root, file)

                writer = Writer(os.path.relpath(file_path, directory), debug)

                with open(file_path) as f:
                    read_func(f.read(), writer)

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
        print("Directory: {}".format(prospective_dir))
        crawl_dir(prospective_dir, args.debug)
    else:
        print("Invalid directory: {}".format(prospective_dir))

if __name__ == "__main__":
    main()
