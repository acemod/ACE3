import subprocess
try:
    result = subprocess.call("python make.py checkexternal test")
    print (result)
except:
    raise