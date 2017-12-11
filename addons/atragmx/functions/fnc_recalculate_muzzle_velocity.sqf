/*
 * Author: Ruthberg
 * Recalculates the muzzle velocity based on the muzzle velocity vs. temperature interpolation input
 *
 * Arguments:
 * parse input <BOOL>
 * update display <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_recalculate_muzzle_velocity
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
} forEach (GVAR(workingMemory) select 18);

private _lookupTableSize = count _lookupTable;
if (_lookupTableSize < 2) exitWith {};
_lookupTable sort true;

private _lowerIndex = 0;
private _upperIndex = 1;

for "_index" from 1 to (_lookupTableSize - 1) do {
    _upperIndex = _index;
    _lowerIndex = _upperIndex - 1;
    if (((_lookupTable select _index) select 0) >= GVAR(temperature)) exitWith {};
};

(_lookupTable select _lowerIndex) params ["_lowerDistance", "_lowerMuzzleVelocity"];
(_lookupTable select _upperIndex) params ["_upperDistance", "_upperMuzzleVelocity"];

_muzzleVelocity = 100 max (linearConversion [_lowerDistance, _upperDistance, GVAR(temperature), _lowerMuzzleVelocity, _upperMuzzleVelocity]) min 1400;

if (_muzzleVelocity != GVAR(workingMemory) select 1) then {
    GVAR(workingMemory) set [1, _muzzleVelocity];
    if (_updateDisplay) then {
        call FUNC(update_gun);
        call FUNC(update_gun_ammo_data);
    };
};
