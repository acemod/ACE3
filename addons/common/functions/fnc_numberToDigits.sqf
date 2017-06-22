/*
 * Author: commy2
 * Transforms a number to an array of the correspondending digits.
 *
 * Arguments:
 * 0: Number to 'digitize' <NUMBER>
 * 1: Set the minimal length of the returned array. Useful for getting left hand zeroes. <NUMBER>, optional
 *
 * Return Value:
 * Digits. The maximum count is six digits. <ARRAY>
 *
 * Example:
 * [5, 5] call ace_common_fnc_numberToDigits
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_number", "_minLength"];

_number = _number min 999999;
_number = str _number;

private _length = count _number;

if (isNil "_minLength") then {_minLength = _length};

_minLength = _minLength min 6;

while {_length < _minLength} do {
    _number = "0" + _number;
    _length = _length + 1;
};

private _digits = [];

for "_x" from 0 to (_length - 1) do {
    _digits pushBack parseNumber (_number select [_x, 1]);
};

_digits
