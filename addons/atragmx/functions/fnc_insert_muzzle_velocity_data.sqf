/*
 * Author: Ruthberg
 * Inserts entry in the muzzle velocity vs. temperature interpolation table
 *
 * Arguments:
 * temperature - <NUMBER>
 * muzzle velocity - <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [10, 800] call ace_atragmx_fnc_insert_muzzle_velocity_data
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_temperature", "_muzzleVelocity"];

private _insertIndex = 0;
private _minDiff = 1000;
{
    if (_minDiff > 0 && {(((GVAR(workingMemory) select 18) select _forEachIndex) select 1) == 0}) then {
        _insertIndex = _forEachIndex;
        _minDiff = 0;
    };
    private _t = ((GVAR(workingMemory) select 18) select _forEachIndex) select 0;
    private _diff = abs(_temperature - _t);
    if (_diff == 0) exitWith {
        _insertIndex = _forEachIndex;
    };
    if (_diff < _minDiff) then {
        _insertIndex = _forEachIndex;
        _minDiff = _diff;
    };
} forEach (GVAR(workingMemory) select 18);

(GVAR(workingMemory) select 18) set [_insertIndex, [_temperature, 0 max _muzzleVelocity min 1400]];

call FUNC(update_muzzle_velocity_data);
