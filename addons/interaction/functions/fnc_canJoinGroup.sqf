#include "..\script_component.hpp"
/*
 * Author: commy2
 * Checks if the unit can join a group
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Able to join a group <BOOL>
 *
 * Example:
 * [player, target] call ace_interaction_fnc_canJoinGroup
 *
 * Public: No
 */

params ["_unit", "_target"];

_target call EFUNC(common,isAwake)
&& {side group _unit == side group _target}
&& {group _unit != group _target} // return
