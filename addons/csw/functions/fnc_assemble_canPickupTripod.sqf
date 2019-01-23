#include "script_component.hpp"
/*
 * Author: TCVM
 * Checks if the player can pick-up the tripod.
 *
 * Arguments:
 * 0: Tripod <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can pickup <BOOL>
 *
 * Example:
 * [tripod, player] call ace_csw_fnc_assemble_canPickupTripod
 *
 * Public: No
 */

params ["_tripod", "_player"];

((secondaryWeapon _player) isEqualTo "") && {alive _tripod}

