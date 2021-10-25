#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Handles mouse interaction for attaching rope
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_towing_fnc_onMouseButtonDown
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

