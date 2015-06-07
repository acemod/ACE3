/*
 * Author: Jonpas
 * Stands up the player.
 *
 * Arguments:
 * Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_sitting_fnc_stand;
 *
 * Public: No
 */
#include "script_component.hpp"

// Restore animation
[_this, "", 2] call EFUNC(common,doAnimation);

// Set variables to nil
_this setVariable [QGVAR(sitting), nil];
GVAR(seat) setVariable [QGVAR(seatOccupied), nil, true];
