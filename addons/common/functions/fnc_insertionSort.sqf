/*
 * Author: Ruthberg
 * Sorts an array of numbers
 *
 * Arguments:
 * 0: array <ARRAY>
 * 1: ascending (optional) <BOOL>
 *
 * Return Value:
 * sortedArray (ARRAY)
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_list", ["_ascending", true]];

_list = + _list; // copy array to not alter the original one

private "_tmp";

for "_i" from 1 to (count _list - 1) do {
    _tmp = _list select _i;
    _j = _i;

    while {_j >= 1 && {_tmp < _list select (_j - 1)}} do {
        _list set [_j, _list select (_j - 1)];
        _j = _j - 1;
    };

    _list set [_j, _tmp];
};

if (!_ascending) then {
    reverse _list;
};

_list
