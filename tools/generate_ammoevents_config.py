#!/usr/bin/env python3

import os
import sys
import subprocess

def writeAmmoConfig(f, ammo, ammoLibrary, ammoWritten, explosionEffectsLibrary):
    if not ammo in ammoLibrary:
        f.write('\tclass ' + ammo + ';\n')
        return

    if ammo in ammoWritten:
        return

    ammoParent, explosionEffects, explosionEffectsParent = ammoLibrary[ammo]
    if not ammoParent == '' and not ammoParent in ammoWritten:
        writeAmmoConfig(f, ammoParent, ammoLibrary, ammoWritten, explosionEffectsLibrary)

    f.write('\tclass ' + ammo)
    if ammoParent == '':
        f.write(' {\n')
    else:
        f.write(': ' + ammoParent + ' {\n')

    explosionEffectsNew = 'ACE_ExplosionEffects_' + ammo
    cloudlet = 'ACE_Cloudlet_' + ammo
    scriptPath = '\\z\\ace\\addons\\ammoevents\\scripts\\exploded_' + ammo + '.sqf';
    explosionEffectsLibrary.append((explosionEffectsNew, explosionEffects, ammo, cloudlet, scriptPath))
    f.write('\t\texplosionEffects = "' + explosionEffectsNew + '";\n')
    f.write('\t};\n\n')
    ammoWritten[ammo] = True

def main():
    # Read vanilla data from RPT
    file_rpt = 'C:/Users/nico/AppData/Local/Arma 3/arma3_2016-02-22_01-30-14.rpt'
    ammoLibrary = {}
    with open(file_rpt, 'r') as f:
        for line in f:
            tokens = [x.strip() for x in line.split(',')]
            if tokens[0][-len('AmmoEventsData'):] == 'AmmoEventsData':
                ammo, ammoParent, explosionEffects, explosionEffectsParent = tuple(tokens[1:])
                if ammo[0:len('ace_explosion_reflection_')] == 'ace_explosion_reflection_':
                    continue
                ammoLibrary[ammo] = (ammoParent, explosionEffects, explosionEffectsParent)
                print(ammo, ammoParent, explosionEffects, explosionEffectsParent)

    # Write the patched config
    # CfgAmmo.hpp
    f = open('../addons/ammoevents/CfgAmmo.hpp', 'w')
    f.write('class CfgAmmo {\n')
    ammoWritten = {}
    explosionEffectsLibrary = []
    for ammo, data in ammoLibrary.items():
        writeAmmoConfig(f, ammo, ammoLibrary, ammoWritten, explosionEffectsLibrary)
    f.write('};\n')
    f.close()

    # CfgExplosionEffects.hpp
    f = open('../addons/ammoevents/CfgExplosionEffects.hpp', 'w')
    explosionEffectsWritten = {}
    for explosionEffectsNew, explosionEffects, ammo, cloudlet, scriptPath in explosionEffectsLibrary:
        if not explosionEffects in explosionEffectsWritten:
            f.write('class ' + explosionEffects + ';\n')
            explosionEffectsWritten[explosionEffects] = True

        f.write('class ' + explosionEffectsNew + ': ' + explosionEffects + ' {\n')
        f.write('\tclass ACE_AmmoEvents {\n')
        f.write('\t\tsimulation = "particles";\n')
        f.write('\t\ttype = "' + cloudlet + '";\n')
        f.write('\t\tposition[] = {0,0,0};\n')
        f.write('\t\tintensity = 1;\n')
        f.write('\t\tinterval = 0.1;\n')
        f.write('\t\tlifeTime = 0.1;\n')
        f.write('\t};\n')
        f.write('};\n')
    f.close()

    # CfgExplosionEffects.hpp
    f = open('../addons/ammoevents/CfgCloudlets.hpp', 'w')
    f.write('class CfgCloudlets {\n')
    f.write('\tclass Default;\n')
    for explosionEffectsNew, explosionEffects, ammo, cloudlet, scriptPath in explosionEffectsLibrary:
        f.write('\tclass ' + cloudlet + ': Default {\n')
        f.write('\t\tinterval = 0.1;\n')
        f.write('\t\tlifeTime = 0.01;\n')
        f.write('\t\tbeforeDestroyScript = "' + scriptPath + '"\n')
        f.write('\t};\n\n')
    f.write('};\n')

    # Scripts
    for explosionEffectsNew, explosionEffects, ammo, cloudlet, scriptPath in explosionEffectsLibrary:
        f = open('../addons/ammoevents/scripts/exploded_' + ammo + '.sqf', 'w')
        f.write('[_this, "' + ammo + '"] call ace_ammoevents_fnc_ammoExploded;\n')
        f.close()

    print("\n# Done.")


if __name__ == "__main__":
    sys.exit(main())
