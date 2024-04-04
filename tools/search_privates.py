#!/usr/bin/env python3

import fnmatch
import os
import re
import ntpath
import sys
import argparse

def get_private_declare(content):
    priv_declared = []

    srch = re.compile('private.*')
    priv_srch_declared = srch.findall(content)
    priv_srch_declared = sorted(set(priv_srch_declared))

    priv_dec_str = ''.join(priv_srch_declared)

    srch = re.compile('(?<![_a-zA-Z0-9])(_[a-zA-Z0-9]*?)[ ,\}\]\)";]')
    priv_split = srch.findall(priv_dec_str)
    priv_split = sorted(set(priv_split))
    priv_declared += priv_split;

    srch = re.compile('params \[.*\]|PARAMS_[0-9].*|EXPLODE_[0-9]_PVT.*|DEFAULT_PARAM.*|KEY_PARAM.*|IGNORE_PRIVATE_WARNING.*')
    priv_srch_declared = srch.findall(content)
    priv_srch_declared = sorted(set(priv_srch_declared))

    priv_dec_str = ''.join(priv_srch_declared)

    srch = re.compile('(?<![_a-zA-Z0-9])(_[a-zA-Z0-9]*?)[ ,\}\]\)";]')
    priv_split = srch.findall(priv_dec_str)
    priv_split = sorted(set(priv_split))

    priv_declared += priv_split;

    srch = re.compile('(?i)[\s]*local[\s]+(_[\w\d]*)[\s]*=.*')
    priv_local = srch.findall(content)
    priv_local_declared = sorted(set(priv_local))

    priv_declared += priv_local_declared;


    return priv_declared

def check_privates(filepath):
    bad_count_file = 0
    def pushClosing(t):
        closingStack.append(closing.expr)
        closing << Literal( closingFor[t[0]] )

    def popClosing():
        closing << closingStack.pop()

    with open(filepath, 'r') as file:
        content = file.read()

        priv_use = []
        priv_use = []


        # Regex search privates
        srch = re.compile('(?<![_a-zA-Z0-9])(_[a-zA-Z0-9]*?)[ =,\^\-\+\/\*\%\}\]\)";]')
        priv_use = srch.findall(content)
        priv_use = sorted(set(priv_use))

        # Private declaration search
        priv_declared = get_private_declare(content)

        if '_this' in priv_declared: priv_declared.remove('_this')
        if '_this' in priv_use: priv_use.remove('_this')

        if '_x' in priv_declared: priv_declared.remove('_x')
        if '_x' in priv_use: priv_use.remove('_x')

        if '_forEachIndex' in priv_declared: priv_declared.remove('_forEachIndex')
        if '_forEachIndex' in priv_use: priv_use.remove('_forEachIndex')
        if '_foreachIndex' in priv_declared: priv_declared.remove('_foreachIndex')
        if '_foreachIndex' in priv_use: priv_use.remove('_foreachIndex')
        if '_foreachindex' in priv_declared: priv_declared.remove('_foreachindex')
        if '_foreachindex' in priv_use: priv_use.remove('_foreachindex')

        missing = []
        for s in priv_use:
            if s.lower() not in map(str.lower,priv_declared):
                if s.lower() not in map(str.lower,missing):
                    missing.append(s)

        if len(missing) > 0:
            print (filepath)

            private_output = 'private[';
            first = True
            for bad_priv in missing:
                if first:
                    first = False
                    private_output = private_output + '"' + bad_priv
                else:
                    private_output = private_output + '", "' + bad_priv

            private_output = private_output + '"];';
            print (private_output)

            for bad_priv in missing:
                print ('\t' + bad_priv)
                bad_count_file = bad_count_file + 1



    return bad_count_file

def main():

    print("#########################")
    print("# Search your Privates  #")
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
        bad_count = bad_count + check_privates(filename)


    print ("Bad Count {0}".format(bad_count))

if __name__ == "__main__":
    main()
