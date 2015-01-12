#!/usr/bin/env python3

import os
import sys
import re

# VERSION NUMBERING TOOL
# Author: KoffeinFlummi
# ----------------------
# Allows for easy changes of, you know, version numbers

def get_all_modules(projectpath):
  modules = os.listdir(projectpath)
  modules = list(filter(lambda x: os.path.exists(os.path.join(projectpath, x, "config.cpp")), modules))
  return modules

def replace_version_number(filepath, version, versionAr):
  fileInput = open(filepath, "r", encoding="utf-8")
  content = fileInput.read()

  # version
  p = re.compile("CfgPatches(.*?)version(.*?)\"(.*?)\"", re.DOTALL)
  content = p.sub(r'CfgPatches\1version\2"' + version + '"', content)

  # versionStr
  p = re.compile("CfgPatches(.*?)versionStr(.*?)\"(.*?)\"", re.DOTALL)
  content = p.sub(r'CfgPatches\1versionStr\2"' + version + '"', content)

  # versionAr
  p = re.compile("CfgPatches(.*?)versionAr\[\](.*?)\{(.*?)\}", re.DOTALL)
  content = p.sub(r'CfgPatches\1versionAr[]\2{' + versionAr + '}', content)

  fileOutput = open(filepath, "w", encoding="utf-8")
  fileOutput.write(content)

def main(version):
  versionAr = version.split(".")
  try:
    versionAr = list(map(lambda x: int(x), versionAr))
  except:
    print("ERROR: Version number doesn't consist of numbers.")
    sys.exit(1)
  while len(versionAr) < 3:
    versionAr.append(0)
  versionAr = list(map(lambda x: str(x), versionAr))
  versionAr = ",".join(versionAr)

  scriptpath = os.path.realpath(__file__)
  projectpath = os.path.dirname(os.path.dirname(scriptpath))
  projectpath = os.path.join(projectpath, "addons")
  modules = get_all_modules(projectpath)

  for module in modules:
    print("# Updating %s" % (module))
    fullpath = os.path.join(projectpath, module, "config.cpp")
    try:
      replace_version_number(fullpath, version, versionAr)
    except:
      print("  Failed to update %s" % (module))

if __name__ == "__main__":
  try:
    main(sys.argv[1])
  except:
    print("No version number specified.")
    sys.exit(1)
