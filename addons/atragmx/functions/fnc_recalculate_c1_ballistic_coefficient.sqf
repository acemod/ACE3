/*
 * Author: Ruthberg
 * Recalculates the c1 ballistic coefficient based on the c1 ballistic coefficient vs. distance interpolation input
 *
 * Arguments:
 * parse input <BOOL>
 * update display <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_recalculate_c1_ballistic_coefficient
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_parseInput", "_updateDisplay"];

if (_parseInput) then {
    [] call FUNC(parse_input);
};

private _lookupTable = [];
{
    if ((_x select 1) > 0) then {
        _lookupTable pushBack _x;
    };
} forEach (GVAR(workingMemory) select 19);

private _lookupTableSize = count _lookupTable;
if (_lookupTableSize < 2) exitWith {};
_lookupTable sort true;

private ["_lowerIndex", "_upperIndex"];
for "_index" from 1 to (_lookupTableSize - 1) do {
    _upperIndex = _index;
    _lowerIndex = _upperIndex - 1;
    if (((_lookupTable select _index) select 0) >= (GVAR(targetRange) select GVAR(currentTarget))) exitWith {};
};

private ["_lowerDistance", "_upperDistance", "_lowerC1", "_upperC1", "_c1"];
_lowerDistance = (_lookupTable select _lowerIndex) select 0;
_upperDistance = (_lookupTable select _upperIndex) select 0;
_lowerC1       = (_lookupTable select _lowerIndex) select 1;
_upperC1       = (_lookupTable select _upperIndex) select 1;
_c1 = _lowerC1;
if (_lowerDistance != _upperDistance) then {
    private _slope = (_upperC1 - _lowerC1) / (_upperDistance - _lowerDistance);
    _c1 = _lowerC1 + ((GVAR(targetRange) select GVAR(currentTarget)) - _lowerDistance) * _slope;
};
_c1 = 0.1 max _c1 min 2.0;

if (_c1 != GVAR(workingMemory) select 15) then {
    GVAR(workingMemory) set [15, _c1];
    if (_updateDisplay) then {
        call FUNC(update_gun);
        call FUNC(update_gun_ammo_data);
    };
};
