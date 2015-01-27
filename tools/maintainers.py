#!/usr/bin/env python3

import os
import sys

def get_all_paths(root):
  path = os.path.join(root, "addons")
  fpaths = []
  for f in os.listdir(path):
    fpath = os.path.join(path, f, "README.md")
    if not os.path.exists(fpath):
      fpaths.append(fpath)
  return fpaths

def add_readme(path):
  name = os.path.split(os.path.dirname(path))[-1]
  name = "ace_"+name
  print("\n# COMPONENT: {}".format(name))

  description = input("Desc: ")
  
  maintainers = [
    "KoffeinFlummi",
    "commy2",
    "esteldunedain",
    "CorruptedHeart",
    "PabstMirror",
    "bux578",
    "Glowbal",
    "walterpearce",
    "NouberNou"
  ]
  for (i, m) in enumerate(maintainers):
    print("({}) {}".format(i, m), end="")
    if i+1 < len(maintainers):
      print(", ", end="")
    else:
      print("")
  mstring = input("Maintainers: ")

  content = name + "\n" + "=" * len(name) + "\n\n"
  content += description + "\n\n\n"
  content += "## Maintainers\n\n"
  content += "The people responsible for merging changes to this component or answering potential questions.\n\n"
  for i in mstring.split(","):
    mname = maintainers[int(i)]
    content += "- [{}](https://github.com/{})\n".format(mname, mname)

  f = open(path, "w")
  f.write(content)
  f.close()

def main():
  projectroot = os.path.realpath(__file__)
  projectroot = os.path.dirname(os.path.dirname(projectroot))

  paths = get_all_paths(projectroot)
  print(len(paths))

  for path in paths:
    add_readme(path)

if __name__ == "__main__":
  main()
