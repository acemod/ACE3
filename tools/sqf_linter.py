#!/usr/bin/env python3

# Requires: https://github.com/LordGolias/sqf

import fnmatch
import os
import sys
import argparse
from sqf.parser import parse
import sqf.analyzer
from sqf.exceptions import SQFParserError


def analyze(filename, writer=sys.stdout):
    with open(filename, 'r') as file:
        code = file.read()
        try:
            result = parse(code)
        except SQFParserError as e:
            print("{}:".format(filename))
            writer.write('    [%d,%d]:%s\n' % (e.position[0], e.position[1] - 1, e.message))
            return -1

        exceptions = sqf.analyzer.analyze(result).exceptions
        if (exceptions): 
            print("{}:".format(filename))
            for e in exceptions:
                writer.write('    [%d,%d]:%s\n' % (e.position[0], e.position[1] - 1, e.message))
            return len(exceptions)
    
    return 0
         
def main():
    print("#########################")
    print("# Lint Check  #")
    print("#########################")

    sqf_list = []
    all_warnings = 0
    all_errors = 0
    
    parser = argparse.ArgumentParser()
    parser.add_argument('-m','--module', help='only search specified module addon folder', required=False, default=".")
    args = parser.parse_args()
 
    for root, dirnames, filenames in os.walk('../addons' + '/' + args.module):
        for filename in fnmatch.filter(filenames, '*.sqf'):
            sqf_list.append(os.path.join(root, filename))
        
    for filename in sqf_list:
        ret = analyze(filename)
        if (ret < 0):
            all_errors = all_errors + 1
        else:
            all_warnings = all_warnings + ret
    
    print ("Parse Errors {0} - Warnings {1}".format(all_errors,all_warnings))

    # return (all_errors + all_warnings)
    return all_errors
    
if __name__ == "__main__":
    main()
