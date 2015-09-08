/*
 * Author: KoffeinFlummi, commy2
 *
 * Filters array and removes every element not fitting the condition
 *
 * Arguments:
 * 0: Array to be filtered <ARRAY>
 * 1: Code to be evaluated <CODE>
 *
 * Return Value:
 * Filtered array <ARRAY>
 *
 * Usage:
 * [[0, 1, 2, 3, 4], {_this > 2}] call ace_common_fnc_filter ==> [3, 4]
 *
 * Public: No
 */
#include "script_component.hpp"

private "_result";

if (params ["_array", "_code"]) exitWith {
  diag_log text format ["[ACE] ERROR: No array for function filter in %1", _fnc_scriptNameParent];
  []
};

_result = [];
{
    if (_x call _code) then {
        _result pushBack _x;
    };
    nil
} count _array;

_result
