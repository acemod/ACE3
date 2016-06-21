/*
 * Author: SilentSpike
 * Reports a social security number generated from the units name.
 *
 * Arguments:
 * 0: Name of a unit <STRING>
 *
 * Return Value:
 * A random three/two/four format social security number <STRING>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name"];
private _length = count _name;
private _chars = toArray _name;

// For short names, reuse characters
if (_length < 9) then {
    // Iterates every second character, swapping odd/even with each loop
    for [{_i = 0},{_i < 2*(9 - _length)},{_i = _i + 2}] do {
        _chars pushBack (_chars select floor((_i + (_i/_length % 2)) % _length));
    };
};

// Offset array slice for long names to make generation more unique
private _slice = [0, _length % 9] select (_length > 9);
private _nums = (_chars select [_slice, 9]) apply { _x % 10 };

([_nums select [0,3],_nums select [3,2], _nums select [5,4]] apply { _x joinString "" }) joinString "-"
