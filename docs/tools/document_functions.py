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

def process_author(text):
    authors = text.splitlines()[0]
    description = "".join([x[3:] for x in text.splitlines(1)[1:]])
    return [authors, description]

def process_argument(argument):
    definition = re.match(r"^(\d+):\s(.+)\<([\s\w]+)\>\s?(\(default: ([\w\s]+)\))?", argument);

    if definition:
        index = definition.group(1)
        name = definition.group(2)
        data_types = definition.group(3).split(" or ")
        default_value = definition.group(5)
    else:
        return []
    return [index, name, data_types, default_value]

def process_arguments(text):
    # Remove the header characters
    arguments = [x[3:] for x in text.splitlines(1)]

    # Find lines which new arguments start on (for multi-line descriptions)
    arg_indices = [i for i, line in enumerate(arguments) if re.match(r"^\d+:", line)]

    return [process_argument(arguments[i]) for i in arg_indices]

def process_return(text):
    return

def process_example(text):
    return

def read_func(code, debug=False):
    header = re.match(r"\s*/\*.+?\*/", code, re.S)
    if header:
        sections = re.split(r"^\s\*\s+(Author|Argument|Return Value|Example|Public)s?:\s?", header.group(), 0, re.I|re.M)

        # Check if public
        try:
            public_value = re.match(r"(Yes|No)", sections[sections.index("Public") + 1], re.I)

            if public_value:
                is_public = public_value.group().lower() == "yes"
            else:
                return "Invalid \"Public\" header value"
        except ValueError:
            return "Missing \"Public\" header section"

        # Just return here if private function
        if not is_public:
            return ""

        # Process the Author: section
        try:
            author_text = sections[sections.index("Author") + 1]
        except ValueError:
            return "Missing \"Author\" header section"

        # Process the Arguments: section
        try:
            arguments_text = sections[sections.index("Argument") + 1]
        except ValueError:
            return "Missing \"Arguments\" header section"

        # Process the Return Value: section
        try:
            return_text = sections[sections.index("Return Value") + 1]
        except ValueError:
            return "Missing \"Return Value\" header section"

        # Process the Example: section
        try:
            example_text = sections[sections.index("Example") + 1]
        except ValueError:
            return "Missing \"Example\" header section"

        if not debug:
            print(process_author(author_text))
            print(process_arguments(arguments_text))
            process_return(return_text)
            process_example(example_text)
            #document_public(sections)
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
