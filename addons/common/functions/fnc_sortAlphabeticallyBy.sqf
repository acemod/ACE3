/*
 * Author: Glowbal
 * ?
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * ?
 *
 * Public: Yes
 *
 * Deprecated
 */
#include "script_component.hpp"

ACE_DEPRECATED("ace_common_fnc_sortAlphabeticallyBy","3.5.0","sort");

params ["_array", "_elementN"];

private _indices = [];
private _elements = [];

{
    private _theElement = toArray (_x select _elementN);
    _indices pushBack _forEachIndex;
    _elements pushBack _theElement;
} forEach _array;

for "_i" from 1 to (count _elements) - 1 do {
    private _tmp = _elements select _i;
    private _tempIndex = _indices select _i;
    _j = _i;
    while {_j >= 1 && {_tmp < _elements select (_j - 1)}} do {
        _elements set [_j, _elements select (_j - 1)];
        _indices set [_j, _indices select (_j - 1)];
        _j = _j - 1;
    };
    _elements set[_j, _tmp];
    _indices set [_j, _tempIndex];
};

private _returnArray = [];

{
    _returnArray pushBack (_array select _x);
} forEach _indices;

_returnArray
