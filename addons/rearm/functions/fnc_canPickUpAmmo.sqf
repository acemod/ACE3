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
 * [player, tank] call ace_rearm_fnc_canPickUpAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];

!(isNull _unit  || {!(_unit isKindOf "CAManBase")} || {!local _unit} || { (_target distance _unit) > 7})
