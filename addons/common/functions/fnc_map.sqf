/*
 * Author: KoffeinFlummi, commy2
 * Applies given code to every element in an array, LIKE SOMETHING SQF SHOULD HAVE BY DEFAULT. <- :kappa:
 *
 * Arguments:
 * 0: Array to be thingied.
 * 1: Code to be applied to every element.
 *
 * Return Value:
 * Final array
 *
 * Public: Yes
 *
 * Deprecated
 */
#include "script_component.hpp"

params [["_array", [], [[]]], ["_code", {}, [{}]]];

ACE_DEPRECATED("ace_common_fnc_map","3.7.0","apply");

// copy array to not alter the original one
_array = + _array;

{
    _array set [_forEachIndex, _x call _code];
} forEach _array;

_array
