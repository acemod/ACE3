#!/usr/bin/env python3

import fnmatch
import os
import re
import sys
import argparse

def check_config_style(filepath):
    bad_count_file = 0

    reIsClass = re.compile(r'^\s*class(.*)')
    reIsClassInherit = re.compile(r'^\s*class(.*):')
    reIsClassBody = re.compile(r'^\s*class(.*){')
    reBadColon = re.compile(r'\s*class (.*) :')
    reSpaceAfterColon = re.compile(r'\s*class (.*): ')
    reSpaceBeforeCurly = re.compile(r'\s*class (.*) {')
    reClassSingleLine = re.compile(r'\s*class (.*)[{;]')

    with open(filepath, 'r', encoding='utf-8', errors='ignore') as file:
        content = file.read()

        # Store all brackets we find in this file, so we can validate everything on the end
        brackets_list = []

        # To check if we are in a comment block
        isInCommentBlock = False
        checkIfInComment = False
        # Used in case we are in a line comment (//)
        ignoreTillEndOfLine = False
        # Used in case we are in a comment block (/* */). This is true if we detect a * inside a comment block.
        # If the next character is a /, it means we end our comment block.
        checkIfNextIsClosingBlock = False

        # We ignore everything inside a string
        isInString = False
        # Used to store the starting type of a string, so we can match that to the end of a string
        inStringType = ''

        lastIsCurlyBrace = False
        checkForSemiColumn = False

        # Extra information so we know what line we find errors at
        lineNumber = 1

        indexOfCharacter = 0
        # Parse all characters in the content of this file to search for potential errors
        for c in content:
            if (lastIsCurlyBrace):
                lastIsCurlyBrace = False
            if c == '\n': # Keeping track of our line numbers
                lineNumber += 1 # so we can print accurate line number information when we detect a possible error
            if (isInString): # while we are in a string, we can ignore everything else, except the end of the string
                if (c == inStringType):
                    isInString = False
            # if we are not in a comment block, we will check if we are at the start of one or count the () {} and []
            elif (isInCommentBlock == False):

                # This means we have encountered a /, so we are now checking if this is an inline comment or a comment block
                if (checkIfInComment):
                    checkIfInComment = False
                    if c == '*': # if the next character after / is a *, we are at the start of a comment block
                        isInCommentBlock = True
                    elif (c == '/'): # Otherwise, will check if we are in an line comment
                        ignoreTillEndOfLine = True # and an line comment is a / followed by another / (//) We won't care about anything that comes after it

                if (isInCommentBlock == False):
                    if (ignoreTillEndOfLine): # we are in a line comment, just continue going through the characters until we find an end of line
                        if (c == '\n'):
                            ignoreTillEndOfLine = False
                    else: # validate brackets
                        if (c == '"' or c == "'"):
                            isInString = True
                            inStringType = c
                        elif (c == '/'):
                            checkIfInComment = True
                        elif (c == '('):
                            brackets_list.append('(')
                        elif (c == ')'):
                            if (len(brackets_list) > 0 and brackets_list[-1] in ['{', '[']):
                                print("ERROR: Possible missing round bracket ')' detected at {0} Line number: {1}".format(filepath,lineNumber))
                                bad_count_file += 1
                            brackets_list.append(')')
                        elif (c == '['):
                            brackets_list.append('[')
                        elif (c == ']'):
                            if (len(brackets_list) > 0 and brackets_list[-1] in ['{', '(']):
                                print("ERROR: Possible missing square bracket ']' detected at {0} Line number: {1}".format(filepath,lineNumber))
                                bad_count_file += 1
                            brackets_list.append(']')
                        elif (c == '{'):
                            brackets_list.append('{')
                        elif (c == '}'):
                            lastIsCurlyBrace = True
                            if (len(brackets_list) > 0 and brackets_list[-1] in ['(', '[']):
                                print("ERROR: Possible missing curly brace '}}' detected at {0} Line number: {1}".format(filepath,lineNumber))
                                bad_count_file += 1
                            brackets_list.append('}')
                        elif (c== '\t'):
                            print("ERROR: Tab detected at {0} Line number: {1}".format(filepath,lineNumber))
                            bad_count_file += 1

            else: # Look for the end of our comment block
                if (c == '*'):
                    checkIfNextIsClosingBlock = True
                elif (checkIfNextIsClosingBlock):
                    if (c == '/'):
                        isInCommentBlock = False
                    elif (c != '*'):
                        checkIfNextIsClosingBlock = False
            indexOfCharacter += 1

        if brackets_list.count('[') != brackets_list.count(']'):
            print("ERROR: A possible missing square bracket [ or ] in file {0} [ = {1} ] = {2}".format(filepath,brackets_list.count('['),brackets_list.count(']')))
            bad_count_file += 1
        if brackets_list.count('(') != brackets_list.count(')'):
            print("ERROR: A possible missing round bracket ( or ) in file {0} ( = {1} ) = {2}".format(filepath,brackets_list.count('('),brackets_list.count(')')))
            bad_count_file += 1
        if brackets_list.count('{') != brackets_list.count('}'):
            print("ERROR: A possible missing curly brace {{ or }} in file {0} {{ = {1} }} = {2}".format(filepath,brackets_list.count('{'),brackets_list.count('}')))
            bad_count_file += 1

        file.seek(0)
        for lineNumber, line in enumerate(file.readlines()):
            if reIsClass.match(line):
                if reBadColon.match(line):
                    print(f"WARNING: bad class colon {filepath} Line number: {lineNumber+1}")
                    # bad_count_file += 1
                if reIsClassInherit.match(line):
                    if not reSpaceAfterColon.match(line):
                        print(f"WARNING: bad class missing space after colon {filepath} Line number: {lineNumber+1}")
                if reIsClassBody.match(line):
                    if not reSpaceBeforeCurly.match(line):
                        print(f"WARNING: bad class inherit missing space before curly braces {filepath} Line number: {lineNumber+1}")
                if not reClassSingleLine.match(line):
                    print(f"WARNING: bad class braces placement {filepath} Line number: {lineNumber+1}")
                    # bad_count_file += 1

    return bad_count_file

def main():

    print("Validating Config Style")

    sqf_list = []
    bad_count = 0

    parser = argparse.ArgumentParser()
    parser.add_argument('-m','--module', help='only search specified module addon folder', required=False, default="")
    args = parser.parse_args()

    for folder in ['addons', 'optionals']:
        # Allow running from root directory as well as from inside the tools directory
        rootDir = "../" + folder
        if (os.path.exists(folder)):
            rootDir = folder

        for root, dirnames, filenames in os.walk(rootDir + '/' + args.module):
            for filename in fnmatch.filter(filenames, '*.cpp'):
                sqf_list.append(os.path.join(root, filename))
            for filename in fnmatch.filter(filenames, '*.hpp'):
                sqf_list.append(os.path.join(root, filename))

    for filename in sqf_list:
        bad_count = bad_count + check_config_style(filename)

    print("------\nChecked {0} files\nErrors detected: {1}".format(len(sqf_list), bad_count))
    if (bad_count == 0):
        print("Config validation PASSED")
    else:
        print("Config validation FAILED")

    return bad_count

if __name__ == "__main__":
    sys.exit(main())
