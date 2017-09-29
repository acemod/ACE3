/*
 * Author: GitHawk
 * Checks if unit can read supply counter. [Only for GVAR(supply) > 0]
 *
 * Arguments:
 * 0: Ammo Truck <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can read supply counter <BOOL>
 *
 * Example:
 * [ammo_truck, player] call ace_rearm_fnc_canReadSupplyCounter
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_truck", "_unit"];

(alive _unit)
&& {_unit isKindOf "CAManBase"}
&& {local _unit}
&& {alive _truck}
&& {(_truck distance _unit) < REARM_ACTION_DISTANCE}
&& {GVAR(supply) > 0}
&& {[_unit, _truck, ["IsNotInside"]] call EFUNC(common,canInteractWith)} // manually added actions need this

