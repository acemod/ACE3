# PabstMirror - Overwrites all files in /include with updated version from a p-drive

import os
import shutil

include_base_path = os.path.join(os.path.dirname(os.getcwd()), "include")
p_drive_path = "P:\\"

if not os.path.exists(p_drive_path):
    raise Exception("No P-drive")

for root, _dirs, files in os.walk(include_base_path):
    relative_path = os.path.relpath(root, include_base_path)
    for file in files:
        if file == "$PBOPREFIX$":
            continue
        file_r_path = os.path.join(include_base_path, relative_path, file)
        file_v_path = os.path.join(p_drive_path, relative_path, file)
        if not os.path.isfile(file_v_path):
            raise Exception("Missing p-drive file {}".format(file_v_path))
        shutil.copyfile(file_v_path, file_r_path)
