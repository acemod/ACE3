/*
 * Author: Glowbal
 * Make a copy of an array with only the unique elements.
 *
 * Arguments:
 * 0: array <ARRAY>
 *
 * Return Value:
 * Copy of original array <ARRAY>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_array"];

private "_result";
_result = [];

{
    if !(_x in _result) then {
        _result pushBack _x;
    };
    false
} count _array;

_result
