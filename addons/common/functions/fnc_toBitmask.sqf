#include "..\script_component.hpp"
/*
 * Author: commy2
 * Convert an array of booleans into a number.
 * Takes Input <ARRAY of BOOLs> (limited to float precision)
 *
 * Arguments:
 * 0: Boolean (least significant bit) <BOOL>
 *
 * Return Value:
 * Bitmask <NUMBER>
 *
 * Example:
 * [[true, false]] call ace_common_fnc_toBitmask
 *
 * Public: Yes
 */

private _result = 0;

{
    if (_x) then {_result = _result + 2 ^ _forEachIndex};
} forEach _this;

_result
