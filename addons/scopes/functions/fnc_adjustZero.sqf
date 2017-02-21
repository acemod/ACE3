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

private ["_weaponIndex", "_adjustment", "_zeroing"];

params ["_unit"];

if (vehicle _unit != _unit) exitWith {false};

_weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith {false};

_adjustment = _unit getVariable [QGVAR(Adjustment), [[0, 0, 0], [0, 0, 0], [0, 0, 0]]];
_zeroing = _adjustment select _weaponIndex;
_zeroing params ["_elevation", "_windage", "_zero"];

_zero = round((_zero + _elevation) * 10) / 10;
_elevation = 0;

[_unit, _elevation, _windage, _zero] call FUNC(applyScopeAdjustment);

true
