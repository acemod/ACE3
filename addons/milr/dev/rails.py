
out_compatibleArray = "    compatibleItems[] += {QGVAR(base),"
out_compatibleClasses = "        GVAR(base)=1;"
out_weapons = ""

def addItem(i):
    global out_compatibleArray, out_compatibleClasses, out_weapons
    name = f"GVAR({i:03})"
    out_compatibleArray += f"Q{name},"
    out_compatibleClasses += f"{name}=1;"
    out_weapons += f"ZERO({i:03});"

for i in range(0, 100, 2):
    addItem(i)
for i in range(100, 302, 10):
    addItem(i)



out_compatibleArray = out_compatibleArray.rstrip(",") + "};"

print("--- GENERATED OUTPUT ---")
print("--- compat array:")
print(out_compatibleArray)
print("--- compat classes:")
print(out_compatibleClasses)
print("--- weapons:")
print(out_weapons)
