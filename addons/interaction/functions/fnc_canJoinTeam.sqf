#include "..\script_component.hpp"
/*
 * Author: commy2
 * Checks if the player can join a team
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Able to join a team <BOOL>
 *
 * Example:
 * [player, target] call ace_interaction_fnc_canJoinTeam
 *
 * Public: No
 */

params ["_unit", "_target"];

_target call EFUNC(common,isAwake)
&& {!([_target] call EFUNC(common,isPlayer))}
&& {_target in units group _unit}
