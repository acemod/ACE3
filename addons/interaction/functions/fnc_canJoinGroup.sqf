/*
 * Author: commy2
 * Checks if the player can join a group
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return value:
 * Able to join a group <BOOL>
 *
 * Example:
 * [player, target] call ace_interaction_fnc_canJoinGroup
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_unit", "_target"];

alive _target
&& {!(_target getVariable ["ACE_isUnconscious", false])}
&& {side group _unit == side group _target}
&& {group _unit != group _target}
