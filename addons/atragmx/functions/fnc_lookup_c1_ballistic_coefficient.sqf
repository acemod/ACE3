/*
 * Author: Ruthberg
 * Lookup the correct C1 ballistic coefficient in the c1 ballistic coefficient vs. distance interpolation table
 *
 * Arguments:
 * Target Range <NUMBER>
 *
 * Return Value:
 * C1 ballistic coefficient <NUMBER
 *
 * Example:
 * call ace_atragmx_fnc_lookup_c1_ballistic_coefficient
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_targetRange"];

private _lookupTable = [];
{
    if ((_x select 1) > 0) then {
        _lookupTable pushBack _x;
    };
} forEach (GVAR(workingMemory) select 19);

private _lookupTableSize = count _lookupTable;
if (_lookupTableSize < 2) exitWith { (GVAR(workingMemory) select 15) };
_lookupTable sort true;

private _lowerIndex = -1;
private _upperIndex = -1;

for "_index" from 1 to (_lookupTableSize - 1) do {
    _upperIndex = _index;
    _lowerIndex = _upperIndex - 1;
    if (((_lookupTable select _index) select 0) >= _targetRange) exitWith { (GVAR(workingMemory) select 15) };
};

private _lowerDistance = (_lookupTable select _lowerIndex) select 0;
private _upperDistance = (_lookupTable select _upperIndex) select 0;
private _lowerC1       = (_lookupTable select _lowerIndex) select 1;
private _upperC1       = (_lookupTable select _upperIndex) select 1;
private _c1 = _lowerC1;
if (_lowerDistance != _upperDistance) then {
    private _slope = (_upperC1 - _lowerC1) / (_upperDistance - _lowerDistance);
    _c1 = _lowerC1 + (_targetRange - _lowerDistance) * _slope;
};
_c1 = 0.1 max _c1 min 2.0;

_c1
