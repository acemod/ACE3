#!/usr/bin/env python3
"""
Author: kymckay
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
        self.lint_private = False

        # Empty until imported from file
        self.path = ""
        self.header = ""

        # Defaults until header is processed
        self.public = False
        self.authors = []
        self.description = ""
        self.arguments = []
        self.return_value = []
        self.example = ""

        # Filepath should only be logged once
        self.logged = False

        # Count parse results
        self.errors = 0

    def import_header(self, file_path):
        self.path = file_path

        with open(file_path, "r", encoding="utf-8") as file:
            code = file.read()

        header_match = re.search(r"\s*/\*.+?\*/", code, re.S)
        if header_match:
            self.header = header_match.group(0)
        else:
            self.feedback("Missing header", 3)

    def has_header(self):
        return bool(self.header)

    def process_header(self, debug=False, lint_private=False):
        # Detailed debugging occurs here so value is set
        self.debug = debug
        self.lint_private = lint_private

        for lineNumber, line in enumerate(self.header.splitlines()):
            if (not (line.startswith(" * ") or line in ["", " *", "/*", "*/", " */"])):
                self.feedback(f"header formatting on line {lineNumber+1}: ({line})", 1)

        # Preemptively cut away the comment characters (and leading/trailing whitespace)
        self.header_text = "\n".join([x[3:].strip() for x in self.header.splitlines()])

        # Split the header into expected sections
        self.sections = re.split(r"^(Author|Argument|Return Value|Example|Public)s?:\s?", self.header_text, maxsplit=0, flags=re.M)

        # If public section is missing we can't continue
        public_raw = self.get_section("Public")
        if not public_raw:
            self.feedback("Public value undefined", 3)
            return self.errors

        # Determine whether the header is public
        self.public = self.process_public(public_raw)

        # Don't bother to process the rest if private
        # Unless in debug mode
        if not self.public and not self.lint_private:
            return self.errors

        # Retrieve the raw sections text for processing
        author_raw = self.get_section("Author")
        arguments_raw = self.get_section("Argument")
        return_value_raw = self.get_section("Return Value")
        example_raw = self.get_section("Example")

        # Author and description are stored in first section
        if author_raw:
            self.authors = self.process_author(author_raw)
            self.description = self.process_description(author_raw)

        if arguments_raw:
            self.arguments = self.process_arguments(arguments_raw)

        # Process return
        if return_value_raw:
            self.return_value = self.process_return_value(return_value_raw)

        # Process example
        if example_raw:
            self.example = self.process_example(example_raw)

        return self.errors

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

        # Separate authors are divided by commas
        return authors_text.split(", ")

    def process_description(self, raw):
        # Just use all the lines after the authors line
        description_text = "".join(raw.splitlines(1)[1:])

        return description_text

    def process_arguments(self, raw):
        lines = raw.splitlines()

        if lines[0] == "None":
            return []

        if lines.count("") == len(lines):
            self.feedback("No arguments provided (use \"None\" where appropriate)", 2)
            return []

        if lines[-1] == "":
            lines.pop()
        else:
            self.feedback("No blank line after arguments list", 1)

        arguments = []
        expectedMainIndex = 0
        expectedSubIndex = 0
        for argument in lines:
            valid = re.match(r"^(- ){0,1}(\d+):\s(.+?)\<([\s\w,\<\>]+?)\>( )?(\s\(default: (.+)\))?$", argument)

            if valid:
                arg_isSubIndex = valid.group(1) is not None
                arg_index = valid.group(2)
                arg_name = valid.group(3)
                arg_types = valid.group(4)
                arg_default = valid.group(7)
                arg_notes = []

                if arg_isSubIndex:
                    expectedIndex = expectedSubIndex
                    expectedSubIndex = expectedSubIndex + 1
                else:
                    expectedIndex = expectedMainIndex
                    expectedMainIndex = expectedMainIndex + 1
                    expectedSubIndex = 0

                if int(arg_index) != expectedIndex:
                    print(f"line|{argument}|")
                    self.feedback(f"Argument index {arg_index} does not match listed order {expectedIndex}", 1)

                if arg_default is None:
                    arg_default = ""

                self.validate_argument_type(arg_types)

                arguments.append([arg_index, arg_name, arg_types, arg_default, arg_notes])
            else:
                # Notes about the above argument won't start with an index
                # Only applies if there exists an above argument
                if re.match(r"^(\d+):", argument) or not arguments:
                    self.feedback("Malformed argument \"{}\"".format(argument), 2)
                    arguments.append(["?", "Malformed", "?", "?", []])
                else:
                    arguments[-1][-1].append(argument)

        return arguments

    def validate_argument_type(self, arg_type: str):
        # Check for bad types
        bad_types = {
            # Bad type -> what type to use instead
            "SCALAR": "NUMBER",
            "NUMVER": "NUMBER",
            "BOOLEAN": "BOOL",
            "POSITION": "ARRAY",
            "LIST": "ARRAY",
            "UNIT": "OBJECT",
        }

        for bad_type, good_type in bad_types.items():
            if bad_type in arg_type.upper():
                self.feedback(f"Bad argument type \"{arg_type}\". Use \"{good_type}\" instead of \"{bad_type}\".", 1)

        # Validated brackets < >
        open_bracket_count = 0
        close_bracket_count = 0
        reported_once = False
        for c in arg_type:
            if c == "<":
                open_bracket_count += 1

            if c == ">":
                close_bracket_count += 1

            if not reported_once and close_bracket_count > open_bracket_count:
                self.feedback(f"Bad argument type \"{arg_type}\". Type is missing an open angle bracket \"<\".", 1)
                reported_once = True

        if close_bracket_count != open_bracket_count:
            self.feedback(f"Bad argument type \"{arg_type}\". Type is missing a close angle bracket \">\".", 1)

        # Validated that types are in upper case
        filtered_arg_type = arg_type.replace("s", "").replace("or", "").replace("of", "")
        if not filtered_arg_type.isupper():
            self.feedback(f"Bad argument type \"{arg_type}\". Type is not in upper case.", 1)

    def process_return_value(self, raw):
        return_value = raw.strip()

        if return_value == "None":
            return []

        valid = re.match(r"^(.+?)\<([\s\w]+?)\>", return_value)

        if valid:
            return_name = valid.group(1)
            return_types = valid.group(2)
        else:
            self.feedback("Malformed return value \"{}\"".format(return_value), 2)
            return ["Malformed", ""]

        return [return_name, return_types]

    def process_example(self, raw):
        return_value = raw.strip()
        if return_value == "None":
            return return_value

        path_match = re.match(r".*addons.(.*).functions.(.*).sqf", self.path)
        expected_func = f"ace_{path_match.group(1)}_{path_match.group(2)}"
        if (not expected_func.lower() in return_value.lower()) and ((not return_value.startswith("Handled by")) and (not return_value.startswith("Called By"))):
            self.feedback(f"Malformed example {return_value} should contain func {expected_func}", 2)

        return return_value


    def document(self, component):
        str_list = []

        # Title
        str_list.append("\n## ace_{}_fnc_{}\n".format(component, os.path.basename(self.path)[4:-4]))
        # Description
        str_list.append("__Description__\n\n" + self.description)
        # Arguments
        if self.arguments:
            str_list.append("__Parameters__\n\nIndex | Description | Datatype(s) | Default Value\n--- | --- | --- | ---\n")
            for argument in self.arguments:
                str_list.append("{} | {} | {} | {}\n".format(*argument))
            str_list.append("\n")
        else:
            str_list.append("__Parameters__\n\nNone\n\n")
        # Return Value
        if self.return_value:
            str_list.append("__Return Value__\n\nDescription | Datatype(s)\n--- | ---\n{} | {}\n\n".format(*self.return_value))
        else:
            str_list.append("__Return Value__\n\nNone\n\n")
        # Example
        str_list.append("__Example__\n\n```sqf\n{}\n```\n\n".format(self.example))
        # Authors
        str_list.append("\n__Authors__\n\n")
        for author in self.authors:
            str_list.append("- {}\n".format(author))
        # Horizontal rule
        str_list.append("\n---\n")

        return ''.join(str_list)

    def log_file(self, error=False):
        # When in debug mode we only want to see the files with errors
        if not self.debug or error:
            if not self.logged:
                rel_path = os.path.relpath(self.path, self.directory)

                self.write("Processing... {}".format(rel_path), 1)
                self.logged = True

    def feedback(self, message, level=0):
        priority_str = ["Info", "Warning", "Error", "Aborted"][level]

        self.log_file(level > 0)
        self.write("{0}: {1}".format(priority_str, message))

        if priority_str in ["Error", "Aborted"]:
            self.errors += 1

    def write(self, message, indent=2):
        to_print = ["  "] * indent
        to_print.append(message)
        print("".join(to_print))


def get_component_name(addons_dir, component):
    errors = 0

    script_component = os.path.join(addons_dir, component, 'script_component.hpp')
    with open(script_component, "r", encoding="utf-8") as file:
        code = file.read()

    name_match = re.search(r"#define COMPONENT_BEAUTIFIED (.*)", code)
    if name_match:
        name = name_match.group(1)
    else:
        name = component.title()
        print("    Warning: Missing COMPONENT_BEAUTIFIED")
        errors += 1

    return name, errors


def document_functions(addons_dir, components):
    errors = 0

    wiki_dir = os.path.abspath(os.path.join(addons_dir, '../docs/wiki/functions/'))
    os.makedirs(wiki_dir, exist_ok=True)
    print("Wiki: {}".format(wiki_dir))

    for component in components:
        print("  Documenting... {}.md".format(component))
        component_name, error = get_component_name(addons_dir, component)
        errors += error

        output = os.path.join(wiki_dir, component) + ".md"
        with open(output, "w", encoding="utf-8") as file:
            file.writelines([
                "---\n",
                "layout: wiki\n",
                "title: {} Functions\n".format(component_name),
                "description: List of functions in {} component.\n".format(component_name),
                "group: functions\n",
                "parent: wiki\n",
                "---\n",
            ])

            for function in components[component]:
                file.write(function.document(component))

    return errors

def getFunctionPath(func):
    return func.path.casefold()

def crawl_dir(addons_dir, directory, debug=False, lint_private=False):
    components = {}
    errors = 0

    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".sqf") and file.startswith("fnc_"):
                file_path = os.path.join(root, file)

                # Attempt to import the header from file
                function = FunctionFile(directory)
                function.import_header(file_path)

                # Undergo data extraction and detailed debug
                if function.has_header():
                    errors += function.process_header(debug, lint_private)

                    if function.is_public() and not debug:
                        # Add functions to component key (initialise key if necessary)
                        component = os.path.basename(os.path.dirname(root))

                        # Sort functions alphabetically
                        functions = components.setdefault(component, [])
                        functions.append(function)
                        functions.sort(key=getFunctionPath)

                        function.feedback("Publicly documented")
                else:
                    errors += 1

    if not debug:
        print()
        errors += document_functions(addons_dir, components)

    if errors != 0:
        print("\n  Unclean!\n    {} errors".format(errors))
    else:
        print("\n  Clean!")

    return errors


def main():
    print("""
    #########################
    # Documenting Functions #
    #########################
    """)

    parser = argparse.ArgumentParser()
    parser.add_argument('directory', nargs="?", type=str, default=".", help='only crawl specified module addon folder')
    parser.add_argument('--debug', action="store_true", help='only check for header debug messages')
    parser.add_argument('--lint-private', action="store_true", help='lint private function headers as well')
    args = parser.parse_args()

    # Allow calling from anywhere and work our way to addons from this file
    addons_dir = os.path.abspath(os.path.join(__file__, '../../../addons/'))
    prospective_dir = os.path.abspath(os.path.join(addons_dir, args.directory))

    if os.path.isdir(prospective_dir):
        print("Directory: {}".format(prospective_dir))
        errors = crawl_dir(addons_dir, prospective_dir, args.debug, args.lint_private)
        return 0 if errors == 0 else 1
    else:
        print("Invalid directory: {}".format(prospective_dir))
        return 1


if __name__ == "__main__":
    sys.exit(main())
