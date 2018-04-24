/*
 * Author: KoffeinFlummi, Ruthberg
 * Resets the zero adjustment of the current scope
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * true <BOOL>
 *
 * Example:
 * [player] call ace_scopes_fnc_resetZero
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (vehicle _unit != _unit) exitWith {false};

private _weaponClass = currentWeapon _unit;
private _weaponIndex = [_unit, _weaponClass] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith {false};

private _adjustment = _unit getVariable [QGVAR(Adjustment), [[0, 0, 0], [0, 0, 0], [0, 0, 0]]];
private _zeroing = _adjustment select _weaponIndex;
_zeroing params ["_elevation", "_windage", "_zero"];

_elevation = round((_zero + _elevation) / MIN_INCREMENT) * MIN_INCREMENT;
_zero = 0;

private _opticsClass = ([_unit] call FUNC(getOptics)) select _weaponIndex;
profileNamespace setVariable [format[QGVAR(PersistentZero_%1_%2), _weaponClass, _opticsClass], nil];

[_unit, _elevation, _windage, _zero] call FUNC(applyScopeAdjustment);

true
