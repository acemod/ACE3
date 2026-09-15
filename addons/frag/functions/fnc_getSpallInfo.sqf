#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function returns spalling parameters for a specific ammo type.
 *
 * Arguments:
 * 0: Ammo classname <STRING>
 *
 * Return Value:
 * _ammoInfo <ARRAY>
 *  0: Caliber config value <NUMBER>
 *  1: What part of the hit damage is from ballistic vs explosive energy (1 for all explosive) <NUMBER>
 *  2: Indirect hit damage <NUMBER>
 *
 * Example:
 * "B_556x45_Ball" call ace_frag_fnc_getSpallInfo
 *
 * Public: No
 */

params ["_ammo"];

GVAR(spallInfoCache) getOrDefaultCall [_ammo, {
    private _ammoConfig = configFile >> "CfgAmmo" >> _ammo;
    private _caliber = getNumber (_ammoConfig >> "caliber");
    private _explosive = getNumber (_ammoConfig >> "explosive");
    private _indirectHit = getNumber (_ammoConfig >> "indirectHitRange");

    [_caliber, _explosive, _indirectHit] // return
}, true]
