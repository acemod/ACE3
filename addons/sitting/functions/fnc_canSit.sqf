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
 * [seat, player] call ace_sitting_fnc_canSit
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_seat", "_player"];

// Sitting enabled, is seat object, not occupied and standing up (or not on a big slope)
GVAR(enable) &&
{getNumber (configFile >> "CfgVehicles" >> typeOf _seat >> QGVAR(canSit)) == 1} &&
{isNil {_seat getVariable QGVAR(seatOccupied)}} &&
{round (vectorUp _seat select 0) == 0 && {round (vectorUp _seat select 1) == 0} && {round (vectorUp _seat select 2) == 1}}
