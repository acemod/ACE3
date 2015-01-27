import os

for root, dirs, files in os.walk(os.getcwd()):  
	for filename in files:  
		oldname = filename
		newname = filename.replace('fn_', 'fnc_')
		
		print os.path.join(root,oldname)
		print newname
		if newname != oldname:
			print os.path.join(root,oldname)
			print oldname + ' -> ' + newname
			os.rename(os.path.join(root,oldname), os.path.join(root,newname))