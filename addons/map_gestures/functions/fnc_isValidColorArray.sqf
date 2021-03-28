#include "script_component.hpp"
/*
 * Author: MikeMatrix
 * Validate if an array is in the propper color format.
 *
 * Arguments:
 * 0: Color Array <ARRAY>
 *
 * Return Value:
 * Is valid Color Array <BOOL>
 *
 * Example:
 * [[1, 0.2, 1, 0.5]] call ace_map_gestures_fnc_isValidColorArray
 *
 * Public: No
 */

scopeName "main";

params ["_colorArray"];

if (isNil "_colorArray") exitWith {false};
if (!(_colorArray isEqualType [])) exitWith {false};
if (count _colorArray != 4) exitWith {false};

{
    if ((!(_x isEqualType 0)) || {_x < 0 || _x > 1}) exitWith {false breakOut "main"};
} count _colorArray;

true
