/**
 * fn_insertionSort.sqf
 * @Descr: Sorts an array of numbers
 * @Author: Ruthberg
 *
 * @Arguments: [array ARRAY, (optional) ascending BOOL]
 * @Return: sortedArray ARRAY
 * @PublicAPI: true
 */

#include "script_component.hpp"

params ["_array", ["_ascending", true]];

private ["_list", "_tmp", "_i", "_j"];
_list = +_array;

for "_i" from 1 to (count _list) - 1 do {
    _tmp = _list select _i;
    _j = _i;
    while {_j >= 1 && {_tmp < _list select (_j - 1)}} do {
        _list set [_j, _list select (_j - 1)];
        _j = _j - 1;
    };
    _list set[_j, _tmp];
};

if (!_ascending) then {
    reverse _list;
};

_list
