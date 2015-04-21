/*
 * Author: KoffeinFlummi, Ruthberg
 * Updates the zero reference for the current scope
 *
 * Argument:
 * 0: Unit <OBJECT>
 *
 * Return value:
 * true <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_unit);

if (vehicle _unit != _unit) exitWith {false};

private ["_weaponIndex", "_adjustment", "_zeroing", "_elevation", "_windage", "_zero"];

_weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith {false};

_adjustment = _unit getVariable QGVAR(Adjustment);
if (isNil "_adjustment") then {
    // [Windage, Elevation, Zero]
    _adjustment = [[0,0,0], [0,0,0], [0,0,0]];
};

_zeroing   = _adjustment select _weaponIndex;
_elevation = _zeroing select 0;
_windage   = _zeroing select 1;
_zero      = _zeroing select 2;

_zero = round((_zero + _elevation) * 10) / 10;
_elevation = 0;

[_unit, _elevation, _windage, _zero] call FUNC(applyScopeAdjustment);

true
