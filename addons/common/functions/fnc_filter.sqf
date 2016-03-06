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
 * Public: Yes
 *
 * Deprecated
 */
#include "script_component.hpp"

params [["_array", [], [[]]], ["_code", {}, [{}]]];

ACE_DEPRECATED("ace_common_fnc_filter","3.7.0","select CODE");

private _result = [];

{
    if (_x call _code) then {
        _result pushBack _x;
    };
    false
} count _array;

_result
