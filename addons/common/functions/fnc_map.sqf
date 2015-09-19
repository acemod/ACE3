/*
 * Author: KoffeinFlummi, commy2
 * Applies given code to every element in an array, LIKE SOMETHING SQF SHOULD HAVE BY DEFAULT.
 *
 * Arguments:
 * 0: Array to be thingied.
 * 1: Code to be applied to every element.
 *
 * Return Value:
 * Final array
 *
 * Usage:
 * [["2", "gobblecock", "25"], {parseNumber _this}] call FUNC(map) ==> [2, 0, 25]
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_array", "_code"];

// copy array to not alter the original one
_array = + _array;

{
    _array set [_forEachIndex, _x call _code];
} forEach _array;
_array
