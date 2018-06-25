#include "script_component.hpp"
/*
 * Author: commy2, SilentSpike
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

params ["_number", "_minLength"];

_number = [_number min 999999, _minLength] call CBA_fnc_formatNumber;

(_number splitString "") apply { parseNumber _x }
