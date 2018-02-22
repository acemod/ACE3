/*
 * Author: LorenLuke (function), BaerMitUmlaut (Extension)
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
 * [100,100] call ace_common_fnc_moveCursor
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_x", "_y"];

if (dialog) exitWith {};

// "bluefcs" callExtension "x100"; "bluefcs" callExtension "y-100"
// Yes, they're backwards. No, I can't fix it because I don't know how to DLL. -Luke
call compile format ['"ace_cursor_movement" callExtension "y%1"',_x];
call compile format ['"ace_cursor_movement" callExtension "x%1"',_y];

//TRACE2
TRACE_2("movecursor",_x, _y);
