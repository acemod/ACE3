/*
 * Author: commy2
 * Checks if the player can join a team
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return value:
 * Able to join a team <BOOL>
 *
 * Example:
 * _bool = [player, target] call ace_interaction_fnc_canJoinTeam
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_unit,_target);

alive _target
&& {!(_target getVariable ["ACE_isUnconscious", false])}
&& {!([_target] call EFUNC(common,isPlayer))}
&& {_target in units group _unit}
