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

private _lowerIndex = 0;
private _upperIndex = 1;

for "_index" from 1 to (_lookupTableSize - 1) do {
    _upperIndex = _index;
    _lowerIndex = _upperIndex - 1;
    if (((_lookupTable select _index) select 0) >= _targetRange) exitWith {};
};

(_lookupTable select _lowerIndex) params ["_lowerDistance", "_lowerC1"];
(_lookupTable select _upperIndex) params ["_upperDistance", "_upperC1"];

(0.1 max (linearConversion [_lowerDistance, _upperDistance, _targetRange, _lowerC1, _upperC1]) min 2.0)
