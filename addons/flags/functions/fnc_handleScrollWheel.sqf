#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Handles the flag object height.
 *
 * Arguments:
 * 0: Scroll amount <NUMBER>
 *
 * Return Value:
 * Handled <BOOL>
 *
 * Example:
 * [5] call ace_flags_fnc_handleScrollWheel
 *
 * Public: No
 */

params ["_scrollAmount"];

if (GVAR(isPlacing) isNotEqualTo PLACE_WAITING) exitWith {false};

// Move object height 10cm per scroll
GVAR(objectHeight) = GVAR(objectHeight) + _scrollAmount * 0.1;

// Clamp height between MIN_HEIGHT and MAX_HEIGHT
GVAR(objectHeight) = MIN_HEIGHT max (GVAR(objectHeight) min MAX_HEIGHT);

true
