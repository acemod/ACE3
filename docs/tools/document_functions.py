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

class FunctionFile:
    def __init__(self, directory="."):
        self.directory = directory

        # False unless specified in processing
        self.debug = False

        # Empty until imported from file
        self.path = ""
        self.header = ""

        # False until determined from header
        self.public = False

        # Filepath should only be logged once
        self.logged = False

    def import_header(self, file_path):
        self.path = file_path

        with open(file_path) as file:
            code = file.read()

        header_match = re.match(r"\s*/\*.+?\*/", code, re.S)
        if header_match:
            self.header = header_match.group(0)
        else:
            self.feedback("Missing header", 3)

    def has_header(self):
        return bool(self.header)

    def process_header(self, debug=False):
        # Detailed debugging occurs here so value is set
        self.debug = debug

        # Preemptively cut away the comment characters (and leading/trailing whitespace)
        self.header_text = "\n".join([x[3:].strip() for x in self.header.splitlines()])

        # Split the header into expected sections
        self.sections = re.split(r"^(Author|Argument|Return Value|Example|Public)s?:\s?", self.header_text, 0, re.M)

        # Retrieve the raw public text for processing
        public_raw = self.get_section("Public")

        # If public section is missing we can't continue
        if not public_raw:
            self.feedback("Public value undefined", 3)
            return

        # Determine whether the header is public
        self.public = self.process_public(public_raw)

        # Don't bother to process the rest if private
        # Unless in debug mode
        if not self.public and not self.debug:
            return

        # Retrieve the raw sections text for processing
        author_raw = self.get_section("Author")
        arguments_raw = self.get_section("Argument")
        return_value_raw = self.get_section("Return Value")
        example_raw = self.get_section("Example")

        # Author and description are stored in first section
        self.authors = self.process_author(author_raw)
        self.description = self.process_description(author_raw)

    def get_section(self, section_name):
        try:
            section_text = self.sections[self.sections.index(section_name) + 1]
            return section_text
        except ValueError:
            self.feedback("Missing \"{}\" header section".format(section_name), 2)
            return ""

    def process_public(self, raw):
        # Raw just includes an EOL character
        public_text = raw[:-1]

        if not re.match(r"(Yes|No)", public_text, re.I):
            self.feedback("Invalid public value \"{}\"".format(public_text), 2)

        return public_text.capitalize() == "Yes"

    def is_public(self):
        return self.public

    def process_author(self, raw):
        # Authors are listed on the first line
        authors_text = raw.splitlines()[0]

        # Seperate authors are divided by commas
        return authors_text.split(", ")

    def process_description(self, raw):
        # Just use all the lines after the authors line
        description_text = "".join(raw.splitlines(1)[1:])

        return description_text


    def log_file(self, error=False):
        # When in debug mode we only want to see the files with errors
        if not self.debug or error:
            if not self.logged:
                rel_path = os.path.relpath(self.path, self.directory)

                self.write("Processing... {}".format(rel_path), 1)
                self.logged = True

    def feedback(self, message, level=0):
        priority_str = ["Info","Warning","Error","Aborted"][level]

        self.log_file(level > 0)
        self.write("{0}: {1}".format(priority_str, message))

    def write(self, message, indent=2):
        to_print = ["  "]*indent
        to_print.append(message)
        print("".join(to_print))

# def process_argument(argument, writer):
#     definition = re.match(r"^(\d+):\s(.+?)\<(\w+?)\>(\s\(default: (.+)\))?$", argument);

#     if definition:
#         index = definition.group(1)
#         name = definition.group(2)
#         data_types = definition.group(3).split("/")
#         default_value = definition.group(5)
#     else:
#         writer.error("Malformed argument {}".format(argument))
#         return Argument()
#     return Argument(index, Value(name, data_types), default_value)

# def process_arguments(text, writer):
#     # Remove the header characters
#     arguments = [x[3:] for x in text.splitlines(1)]

#     if arguments[0] == "None":
#         return [Argument()]

#     # Find lines which new arguments start on (for multi-line descriptions)
#     arg_indices = [i for i, line in enumerate(arguments) if re.match(r"^\d+:", line)]

#     return [process_argument(arguments[i], writer) for i in arg_indices]

# def process_return(text, writer):
#     # Remove header characters and only use first line
#     text = text.splitlines()[0][3:]

#     if text == "None":
#         return ["None", ""]

#     valid_value = re.match(r"^(.+)\<([\s\w]+)\>", text)

#     if valid_value:
#         return [valid_value.group(1), valid_value.group(2)]
#     else:
#         writer.error("Malformed \"Return Value\" {}".format(text))

#     return ["", ""]

def crawl_dir(directory, debug=False):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".sqf") and file.startswith("fnc_"):
                file_path = os.path.join(root, file)

                # Attempt to import the header from file
                function = FunctionFile(directory)
                function.import_header(file_path)

                # Undergo data extraction and detailed debug
                if function.has_header():
                    function.process_header(debug)

                    # Placeholder
                    if function.is_public() and not debug:
                        function.feedback("Publicly documented")

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
