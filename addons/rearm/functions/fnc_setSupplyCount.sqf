/*
 * Author: GitHawk
 * Sets the supply count.
 *
 * Argument:
 * 0: Target <OBJECT>
 * 1: Supply Count <NUMBER>
 *
 * Return value:
 * None
 *
 * Example:
 * [ammo_truck, 1000] call ace_rearm_fnc_setSupplyCount
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_target", objNull, [objNull]], ["_supply", 0, [0]]];

if (isNull _target) exitWith {};

_target setVariable [QGVAR(currentSupply), (_supply max 0), true];
