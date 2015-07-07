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

PARAMS_1(_player);

// Restore animation
[_player, "", 2] call EFUNC(common,doAnimation);

// Set variables to nil
_player setVariable [QGVAR(isSitting), nil];
GVAR(seat) setVariable [QGVAR(seatOccupied), nil, true];
GVAR(seat) = nil;
