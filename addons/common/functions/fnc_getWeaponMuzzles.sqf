/*
 * Author: commy2
 * Get the muzzles of a weapon.
 *
 * Arguments:
 * 0: Weapon <STRING>
 *
 * Return Value:
 * All weapon muzzles <ARRAY>
 *
 * Example:
 * ["gun"] call ace_common_fnc_getWeaponMuzzles
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_weapon", "", [""]]];

private _muzzles = getArray (configFile >> "CfgWeapons" >> _weapon >> "muzzles");

{
    if (_x == "this") then {
        _muzzles set [_forEachIndex, configName (configFile >> "CfgWeapons" >> _weapon)];
    };
} forEach _muzzles;

_muzzles
