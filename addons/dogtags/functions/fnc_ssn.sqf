#include "..\script_component.hpp"
/*
 * Author: kymckay
 * Reports a social security number generated from the unit's name.
 *
 * Arguments:
 * 0: Unit name <STRING>
 *
 * Return Value:
 * A random three/two/four format social security number <STRING>
 *
 * Example:
 * "name" call ace_dogtags_fnc_ssn
 *
 * Public: No
 */

params ["_name"];

private _chars = toArray _name;

// Warning, for strings containing non-latin characters, `_count _name` != `_count _chars`
private _length = count _chars;

_chars pushBack _length;
_length = _length + 1;

private _remainder = 0;
private _nums = [0, 0, 0, 0, 0, 0, 0, 0, 0];

for "_index" from 0 to (8 max _length) do {
    private _inputChar = _chars select (_index % _length);
    _nums set [_index % 9, ((_nums select (_index % 9)) + _inputChar + _remainder) % 10];
    _remainder = (_inputChar + _remainder) % 256;
};

([_nums select [0, 3], _nums select [3, 2], _nums select [5, 4]] apply { _x joinString "" }) joinString "-"
