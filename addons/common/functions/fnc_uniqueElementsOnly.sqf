/*
 * Author: Glowbal
 *
 * Make a copy of an array with only the unique elements.
 *
 * Arguments:
 * 0: array (ARRAY)
 *
 * Return Value:
 * Copy of original array (ARRAY)
 *
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_result", "_value"];

params ["_array"];

_result = [];
{
    _value = _x;
    if ({_x isEqualTo _value} count _result == 0) then {
        _result pushback _x;
    };
    true
} count _array;

_result;
