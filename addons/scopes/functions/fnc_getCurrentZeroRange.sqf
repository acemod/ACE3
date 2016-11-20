/*
 * Author: Ruthberg
 * Gets the zero range of the currently used optic
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * current zero range
 *
 * Example:
 * _unit call ace_scopes_fnc_getCurrentZeroRange
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (!GVAR(enabled)) exitWith { currentZeroing _unit };

private _weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith { currentZeroing _unit };

private _optic = GVAR(Optics) select _weaponIndex;
private _opticConfig = configFile >> "CfgWeapons" >> _optic;
private _opticType = getNumber(_opticConfig >> "ItemInfo" >> "opticType");

private _zeroRange = currentZeroing _unit;
if (_opticType == 2 && {(GVAR(canAdjustElevation) select _weaponIndex) || GVAR(forceUseOfAdjustmentTurrets)}) then {
    _zeroRange = GVAR(defaultZeroRange);
};
if (isNumber (_opticConfig >> "ACE_ScopeZeroRange")) then {
    _zeroRange = getNumber(_opticConfig >> "ACE_ScopeZeroRange");
};

_zeroRange
