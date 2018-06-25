#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Inserts entry in the c1 ballistic coefficient vs. distance interpolation table
 *
 * Arguments:
 * transonic range - <NUMBER>
 * subsonic range - <NUMBER>
 * c1 ballistic coefficient - <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [800, 0.485] call ace_atragmx_fnc_insert_c1_ballistic_coefficient_data
 *
 * Public: No
 */

params ["_transonicRange", "_subsonicRange", "_c1"];

private _entries = {(_x select 1) > 0} count (GVAR(workingMemory) select 19);

if (_entries > 0) then {
    // Insert
    private _insertIndex = 0;
    private _minDiff = 10000;
    {
        if (_minDiff > 0 && {(((GVAR(workingMemory) select 19) select _forEachIndex) select 1) == 0}) then {
            _insertIndex = _forEachIndex;
            _minDiff = 0;
        };
        private _tr = ((GVAR(workingMemory) select 19) select _forEachIndex) select 0;
        private _diff = abs(_subsonicRange - _tr);
        if (_diff == 0) exitWith {
            _insertIndex = _forEachIndex;
        };
        if (_diff < _minDiff) then {
            _insertIndex = _forEachIndex;
            _minDiff = _diff;
        };
    } forEach (GVAR(workingMemory) select 19);

    (GVAR(workingMemory) select 19) set [_insertIndex, [_subsonicRange, 0.1 max _c1 min 2.0]];
} else {
    // Reset
    private _zeroRange  = GVAR(workingMemory) select 2;
    private _bc = GVAR(workingMemory) select 15;
    GVAR(workingMemory) set [19, [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]];
    (GVAR(workingMemory) select 19) set [0, [_zeroRange, _bc]];
    (GVAR(workingMemory) select 19) set [1, [_transonicRange + (_subsonicRange - _transonicRange) * 0.75, _bc]];
    (GVAR(workingMemory) select 19) set [2, [_subsonicRange, 0.1 max _c1 min 2.0]];
};

call FUNC(update_c1_ballistic_coefficient_data);
