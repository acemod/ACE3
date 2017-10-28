/*
 * Author: KoffeinFlummi, Ruthberg
 * Updates the zero reference for the current scope
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * true <BOOL>
 *
 * Example:
 * [player] call ace_scopes_fnc_adjustZero
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (vehicle _unit != _unit) exitWith {false};

private _weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith {false};

private _adjustment = _unit getVariable [QGVAR(Adjustment), [[0, 0, 0], [0, 0, 0], [0, 0, 0]]];
private _zeroing = _adjustment select _weaponIndex;
_zeroing params ["_elevation", "_windage", "_zero"];

_zero = round((_zero + _elevation) * 10) / 10;
_elevation = 0;

[_unit, _elevation, _windage, _zero] call FUNC(applyScopeAdjustment);

true
