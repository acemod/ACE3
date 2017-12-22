/*
 * Author: KoffeinFlummi, Ruthberg
 * Changes the adjustment for the current scope
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Turret and Direction <NUMBER>
 * 2: Major Step <BOOL>
 *
 * Return Value:
 * Did we adjust anything? <BOOL>
 *
 * Example:
 * [player, ELEVATION_UP, false] call ace_scopes_fnc_adjustScope
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_turretAndDirection", "_majorStep"];

if (!(_unit isKindOf "Man")) exitWith {false};
if (currentMuzzle _unit != currentWeapon _unit) exitWith {false};
if (!GVAR(enabled)) exitWith {false};

private _weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith {false};

if (!(GVAR(canAdjustElevation) select _weaponIndex) && (_turretAndDirection in [ELEVATION_UP, ELEVATION_DOWN])) exitWith {false};
if (!(GVAR(canAdjustWindage) select _weaponIndex) && (_turretAndDirection in [WINDAGE_UP, WINDAGE_DOWN])) exitWith {false};

private _adjustment = _unit getVariable [QGVAR(Adjustment), [[0, 0, 0], [0, 0, 0], [0, 0, 0]]];
private _zeroing = _adjustment select _weaponIndex;
_zeroing params ["_elevation", "_windage", "_zero"];

(GVAR(scopeAdjust) select _weaponIndex) params ["_maxVertical", "_verticalIncrement", "_maxHorizontal", "_horizontalIncrement"];

switch (_turretAndDirection) do {
    case ELEVATION_UP:   { _elevation = _elevation + _verticalIncrement };
    case ELEVATION_DOWN: { _elevation = _elevation - _verticalIncrement };
    case WINDAGE_LEFT:   { _windage = _windage - _horizontalIncrement };
    case WINDAGE_RIGHT:  { _windage = _windage + _horizontalIncrement };
};

if (_majorStep) then {
    switch (_turretAndDirection) do {
        case ELEVATION_UP:   { _elevation = ceil(_elevation) };
        case ELEVATION_DOWN: { _elevation = floor(_elevation) };
        case WINDAGE_LEFT:   { _windage = floor(_windage) };
        case WINDAGE_RIGHT:  { _windage = ceil(_windage) };
    };
};

_elevation = round(_elevation / MIN_INCREMENT) * MIN_INCREMENT;
_windage = round(_windage / MIN_INCREMENT) * MIN_INCREMENT;

if ((_elevation + _zero) < _maxVertical select 0 or (_elevation + _zero) > _maxVertical select 1) exitWith {false};
if (_windage < _maxHorizontal select 0 or _windage > _maxHorizontal select 1) exitWith {false};

[_unit, _elevation, _windage, _zero] call FUNC(applyScopeAdjustment);

true
