/*
 * Author: TCVM
 * Checks if the player can pick-up the tripod.
 *
 * Arguments:
 * 0: Tripod <OBJECT>
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can pickup <BOOL>
 *
 * Example:
 * [tripod, player] call ace_csw_fnc_canPickupTripod
 *
 * Public: No
 */
#include "script_component.hpp"

params["_tripod", "_player"];

((secondaryWeapon(_player select 1)) == (""))

