/*
 * Author: commy2
 * Transforms a number to an string of the correspondending digits.
 *
 * Arguments:
 * 0: Number to 'digitize' <NUMBER>
 * 1: Set the minimal length of the returned string. Useful for getting left hand zeroes. (Optional) <NUMBER>
 *
 * Return Value:
 * Digits. The maximum length is six digits. <STRING>
 *
 * Example:
 * [5, 5] call ace_common_fnc_numberToDigitsString
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

_number
