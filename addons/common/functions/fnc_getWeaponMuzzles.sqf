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
 * Public: Yes
 */
#include "script_component.hpp"

params ["_weapon"];

private "_muzzles";
_muzzles = getArray (configFile >> "CfgWeapons" >> _weapon >> "muzzles");

if ("this" in _muzzles) then {
    _muzzles set [_muzzles find "this", _weapon];
};

_muzzles
