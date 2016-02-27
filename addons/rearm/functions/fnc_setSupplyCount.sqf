/*
 * Author: GitHawk
 * Sets the supply count.
 *
 * Argument:
 * 0: Ammo Truck <OBJECT>
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

params [["_truck", objNull, [objNull]], ["_supply", 0, [0]]];

if (isNull _truck) exitWith {};

_truck setVariable [QGVAR(currentSupply), (_supply max 0), true];
