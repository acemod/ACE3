/*
 * Author: LorenLuke (function), BaerMitUmlaut (Extension)
 *
 * Simulates mouse input by number of pixels (not consistent/smooth)
 * Note- using with open dialogs may cause issues when in loops.
 *
 * Arguments:
 * 0: x direction (+right, -left) <NUMBER>
 * 1: y direction (+down, -up) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [100, 100] call ace_common_fnc_moveCursor
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_x", "_y"];

if (!dialog) then {
    "ace_cursor_movement" callExtension format ["x%1", _x];
    "ace_cursor_movement" callExtension format ["y%1", _y];

    TRACE_2("movecursor",_x,_y);
};

nil
