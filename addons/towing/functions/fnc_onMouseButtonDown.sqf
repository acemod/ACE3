#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Handles mouse interaction for attaching rope
 *
 * Arguments:
 * 0: Display (not used) <DISPLAY>
 * 1: Mouse button <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [findDisplay 46, 0] call ace_towing_fnc_onMouseButtonDown
 *
 * Public: No
 */
params ["", "_button"];

if (_button > 1) exitWith {};

if (_button == 1) then {
    GVAR(mouseRight) = true;
} else {
    GVAR(mouseLeft) = true;
}

