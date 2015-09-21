
import fnmatch
import os
import re
import ntpath
import sys
import argparse

def check_sqf_syntax(filepath):
    bad_count_file = 0
    def pushClosing(t):
        closingStack.append(closing.expr)
        closing << Literal( closingFor[t[0]] )

    def popClosing():
        closing << closingStack.pop()

    with open(filepath, 'r') as file:
        content = file.read()
        brackets_list = []

        isInCommentBlock = False
        checkIfInComment = False
        ignoreTillEndOfLine = False
        checkIfNextIsClosingBlock = False
        isInString = False

        lineNumber = 0

        for c in content:
            if c == '\n':
                lineNumber += 1 # so we can print accurate line number information when we detect a possible error
            if (isInString):
                if (c == inStringType):
                    isInString = False
            elif (isInCommentBlock == False): # if we are not in a comment block, we will check if we are at the start of one or count the () {} and []
                if (checkIfInComment): # This means we have encountered a /, so we are now checking if this is an inline comment or a comment block
                    checkIfInComment = False
                    if c == '*': # if the next character after / is a *, we are at the start of a comment block
                        isInCommentBlock = True
                    if (c == '/'): # Otherwise, will check if we are in an line comment
                        ignoreTillEndOfLine = True # and an line comment is a / followed by another / (//) We won't care about anything that comes after it
                if (isInCommentBlock == False):
                    if (ignoreTillEndOfLine): # we are in a line comment, just continue going through the characters until we find an end of line
                        if (c == '\n'):
                            ignoreTillEndOfLine = False
                    else:
                        if (c == '"'):
                            isInString = True
                            inStringType = c
                        elif (c == '/'):
                            checkIfInComment = True
                        elif (c == '('):
                            brackets_list.append('(')
                        elif (c == ')'):
                            if (brackets_list[-1] in ['{', '[']):
                                print "Possible missing bracket detected at )"
                                print filepath + "Line number: " + str(lineNumber)
                                bad_count_file += 1
                            brackets_list.append(')')
                        elif (c == '['):
                            brackets_list.append('[')
                        elif (c == ']'):
                            if (brackets_list[-1] in ['{', '(']):
                                print "Possible missing bracket detected at ]"
                                print filepath + "Line number: " + str(lineNumber)
                                bad_count_file += 1
                            brackets_list.append(']')
                        elif (c == '{'):
                            brackets_list.append('{')
                        elif (c == '}'):
                            if (brackets_list[-1] in ['(', '[']):
                                print "Possible missing bracket detected at }"
                                print filepath + "Line number: " + str(lineNumber)
                                bad_count_file += 1
                            brackets_list.append('}')
            else:
                if (c == '*'):
                    checkIfNextIsClosingBlock = True;
                elif (checkIfNextIsClosingBlock):
                    if (c == '/'):
                        isInCommentBlock = False
                    elif (c != '*'):
                        checkIfNextIsClosingBlock = False

        if brackets_list.count('[') != brackets_list.count(']'):
            print "A possible missing [ or ] in file " + filepath + "[ = " + str(brackets_list.count('[')) + " ] =" + str(brackets_list.count(']'))
            bad_count_file += 1
        if brackets_list.count('(') != brackets_list.count(')'):
            print "A possible missing ( or ) in file " + filepath + "( = " + str(brackets_list.count('(')) + " ) =" + str(brackets_list.count(')'))
            bad_count_file += 1
        if brackets_list.count('{') != brackets_list.count('}'):
            print "A possible missing { or } in file " + filepath + "{ = " + str(brackets_list.count('{')) + " } =" + str(brackets_list.count('}'))
            bad_count_file += 1
    return bad_count_file

def main():

    print("#########################")
    print("# Validate SQF files missing brackets  #")
    print("#########################")

    sqf_list = []
    bad_count = 0

    parser = argparse.ArgumentParser()
    parser.add_argument('-m','--module', help='only search specified module addon folder', required=False, default=".")
    args = parser.parse_args()

    for root, dirnames, filenames in os.walk('../addons' + '/' + args.module):
      for filename in fnmatch.filter(filenames, '*.sqf'):
        sqf_list.append(os.path.join(root, filename))

    for filename in sqf_list:
        bad_count = bad_count + check_sqf_syntax(filename)


    print ("Bad Count {0}".format(bad_count))

if __name__ == "__main__":
    main()
