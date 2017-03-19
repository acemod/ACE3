/*
 * Author: simpo (basing on fnc_canTapShoulder.sqf by commy2)
 * Checks if the player can punch another player.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Able to punch another player <BOOL>
 *
 * Example:
 * [player, target] call ace_interaction_fnc_canPunch
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];

_target isKindOf "CAManBase" &&
{alive _target} &&
{!(_target getVariable ["ACE_isUnconscious", false])} // return
