#include "script_component.hpp"
/*
 * Author: Timi007
 * Handles the flag object height.
 *
 * Arguments:
 * 0: Scroll amount <NUMBER>
 *
 * Return Value:
 * Handled <BOOLEAN>
 *
 * Example:
 * [5] call ace_flags_fnc_handleScrollWheel
 *
 * Public: No
 */

params ["_scrollAmount"];

if (GVAR(isPlacing) isNotEqualTo PLACE_WAITING) exitWith {false};

// Move object height 10cm per scroll
GVAR(objectHeight) = GVAR(objectHeight) + (_scrollAmount * 0.1);

if (GVAR(objectHeight) < MIN_HEIGHT) then {
    GVAR(objectHeight) = MIN_HEIGHT;
};

if (GVAR(objectHeight) > MAX_HEIGHT) then {
    GVAR(objectHeight) = MAX_HEIGHT;
};

true
