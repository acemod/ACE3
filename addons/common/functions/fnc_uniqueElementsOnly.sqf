/**
 * fn_uniqueElementsOnly.sqf
 * @Descr: Make a copy of an array with only the unique elements.
 * @Author: Glowbal
 *
 * @Arguments: [array ARRAY]
 * @Return: ARRAY Copy of original array
 * @PublicAPI: true
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
} forEach _array;

_result;
