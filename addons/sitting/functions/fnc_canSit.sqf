/*
 * Author: Jonpas
 * Check if the player can sit down.
 *
 * Arguments:
 * 0: Seat <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Can Sit Down <BOOL>
 *
 * Example:
 * [seat, player] call ace_sitting_fnc_canSit;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_seat,_player);

// If seat object and not occupied
(getNumber (configFile >> "CfgVehicles" >> typeOf _seat >> QGVAR(canSit)) == 1 && {isNil{_seat getVariable QGVAR(seatOccupied)}})
