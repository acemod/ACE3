/*
 * Author: Ruthberg
 * Gets the zero range of the currently used optic
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * current zero range <NUMBER>
 *
 * Example:
 * [player] call ace_scopes_fnc_getCurrentZeroRange
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (!GVAR(enabled)) exitWith { currentZeroing _unit };

private _weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith { currentZeroing _unit };

private _optic = GVAR(Optics) select _weaponIndex;
private _opticConfig = if (_optic != "") then {
    (configFile >> "CfgWeapons" >> _optic)
} else {
    (configFile >> "CfgWeapons" >> (GVAR(Guns) select _weaponIndex))
};

private _zeroRange = currentZeroing _unit;
if (GVAR(overwriteZeroRange) && {GVAR(canAdjustElevation) select _weaponIndex}) then {
    _zeroRange = GVAR(defaultZeroRange);
};
if (isNumber (_opticConfig >> "ACE_ScopeZeroRange")) then {
    _zeroRange = getNumber(_opticConfig >> "ACE_ScopeZeroRange");
};

_zeroRange
