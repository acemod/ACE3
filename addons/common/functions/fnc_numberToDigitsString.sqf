/*
 * Author: commy2
 *
 * Transforms a number to an string of the correspondending digits.
 *
 * Argument:
 * 0: Number to 'digitize' (Number)
 * 1: Set the minimal length of the returned string. Useful for getting left hand zeroes. (Number, optional)
 *
 * Return value:
 * Digits. The maximum length is six digits. (String)
 */
#include "script_component.hpp"

private ["_digits", "_count", "_string", "_index"];

_digits = _this call FUNC(numberToDigits);

_count = count _digits;

_string = "";
for "_index" from 0 to (_count - 1) do {
  _string = _string + str (_digits select _index);
};
_string
