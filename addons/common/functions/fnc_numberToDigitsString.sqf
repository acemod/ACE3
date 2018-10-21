#include "script_component.hpp"
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

ACE_DEPRECATED(QFUNC(numberToDigitsString),"3.14.0","CBA_fnc_formatNumber");

_this call CBA_fnc_formatNumber
