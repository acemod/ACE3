/*
 * Author: KoffeinFlummi, commy2
 * Filters array and removes every element not fitting the condition
 *
 * Arguments:
 * 0: Array to be filtered.
 * 1: Code to be evaluated.
 *
 * Return Value:
 * Final array
 *
 * Usage:
 * [[0,1,2,3,4], {_this > 2}] call FUNC(filter) ==> [3,4]
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_array", "_code"];

private "_result";
_result = [];

{
    if (_x call _code) then {
        _result pushBack _x;
    };
    false
} count _array;

_result
