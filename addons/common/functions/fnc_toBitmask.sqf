/*
 * Author: commy2
 * Convert an array of booleans into a number.
 *
 * Arguments:
 * N: Booleans <ARRAY>
 *
 * Return Value:
 * Bitmask <NUMBER>
 *
 * Example:
 * [[true, false]] call ace_common_fnc_toBitmask
 *
 * Public: Yes
 */
#include "script_component.hpp"

private _result = 0;

{
    if (_x) then {_result = _result + 2 ^ _forEachIndex};
} forEach _this;

_result
