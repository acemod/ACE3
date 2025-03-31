#include "script_component.hpp"
/*
 * Author: Kingsley
 * Handles the object direction.
 *
 * Arguments:
 * 0: Scroll <NUMBER>
 *
 * Return Value:
 * Handled <BOOL>
 *
 * Example:
 * [5] call ace_fortify_fnc_handleScrollWheel
 *
 * Public: No
 */

if (GVAR(isPlacing) != PLACE_WAITING) exitWith {false};

params ["_scroll"];

if (cba_events_shift) exitWith {
    GVAR(objectRotationX) = GVAR(objectRotationX) + (_scroll * 5);
    true
};

if (cba_events_control) exitWith {
    GVAR(objectRotationY) = GVAR(objectRotationY) + (_scroll * 5);
    true
};

GVAR(objectRotationZ) = GVAR(objectRotationZ) + (_scroll * 5);
true
