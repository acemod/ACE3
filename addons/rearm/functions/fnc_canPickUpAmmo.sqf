/*
 * Author: GitHawk
 * Check if a unit can pick up ammo
 *
 * Arguments:
 * 0: The Player <OBJECT>
 * 1: The Target <OBJECT>
 *
 * Return Value:
 * Can rearm
 *
 * Example:
 * [tank] call ace_rearm_fnc_canPickUpAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];

!(isNull ace_player  || {!(ace_player isKindOf "CAManBase")} || {!local ace_player} || { (_target distance ace_player) > 7})
