#include "..\script_component.hpp"
/*
 * Author: commy2, kymckay
 * Transforms a number to an array of the corresponding digits.
 *
 * Arguments:
 * 0: Number to 'digitize' <NUMBER>
 * 1: Set the minimal length of the returned array. Useful for getting left hand zeroes. <NUMBER> (default: 1)
 *
 * Return Value:
 * Digits. The maximum count is six digits. <ARRAY>
 *
 * Example:
 * [5, 5] call ace_common_fnc_numberToDigits
 *
 * Public: Yes
 */

params ["_number", ["_minLength", 1]];

_number = [_number min 999999, _minLength] call CBA_fnc_formatNumber;

(_number splitString "") apply { parseNumber _x }
