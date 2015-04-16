#!/usr/bin/env python3

import fnmatch
import os
import re
import ntpath
from pyparsing import *



            
def check_privates(filepath):
    
    def pushClosing(t):
        closingStack.append(closing.expr)
        closing << Literal( closingFor[t[0]] )
            
    def popClosing():
        closing << closingStack.pop()
        
    with open(filepath, 'r') as file:
        content = file.read()
        
        priv_use = []
        priv_use = []
        priv_declared = []
        
        # Regex search privates
        srch = re.compile('(?<![_a-zA-Z])(_[a-zA-Z]*?)[ ,\}\]\)";]')
        priv_use = srch.findall(content)
        priv_use = sorted(set(priv_use))
        
        # Private declaration search
        srch = re.compile('private.*')
        priv_srch_declared = srch.findall(content)
        priv_srch_declared = sorted(set(priv_srch_declared))
        
        priv_dec_str = ''.join(priv_srch_declared)
        
        srch = re.compile('"(.+?)"')
        priv_split = srch.findall(priv_dec_str)
        priv_split = sorted(set(priv_split))
        priv_declared += priv_split;
      
        if '_this' in priv_declared: priv_declared.remove('_this')
        if '_this' in priv_use: priv_use.remove('_this')

        if '_x' in priv_declared: priv_declared.remove('_x')
        if '_x' in priv_use: priv_use.remove('_x')
        
        if '_forEachIndex' in priv_declared: priv_declared.remove('_forEachIndex')
        if '_forEachIndex' in priv_use: priv_use.remove('_forEachIndex')
        
        missing = []
        for s in priv_use:
            if s not in priv_declared:
                if s not in missing:
                    missing.append(s)
        
        if len(missing) > 0:
            print filepath
            for bad_priv in missing:
                print '\t' + bad_priv
            
def main():

    print("#########################")
    print("# Search your Privates  #")
    print("#########################")

    sqf_list = []
    for root, dirnames, filenames in os.walk('../addons'):
      for filename in fnmatch.filter(filenames, '*.sqf'):
        sqf_list.append(os.path.join(root, filename))
        
    for filename in sqf_list:
        check_privates(filename)
    
if __name__ == "__main__":
    main()