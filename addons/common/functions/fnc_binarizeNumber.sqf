/*
 * Author: commy2
 * Get a binary equivalent of a decimal number.
 *
 * Arguments:
 * 0: Decimal Number <NUMBER>
 * 1: Minimum length of the returned Array, note: returned array can be larger (default: 8) <NUMBER>
 *
 * Return Value:
 * Booleans <ARRAY>
 *
 * Example:
 * [5, 5] call ace_common_fnc_binarizeNumber
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_number", ["_minLength", 8]];

_number = round _number;

private _array = [];
_array resize _minLength;

for "_index" from 0 to (_minLength - 1) do {
    _array set [_index, false];
};

private _index = 0;

while {_number > 0} do {
    private _rest = _number mod 2;
    _number = floor (_number / 2);

    _array set [_index, _rest == 1];
    _index = _index + 1;
};

_array
