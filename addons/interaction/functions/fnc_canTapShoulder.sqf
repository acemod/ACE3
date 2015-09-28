/*
 * Author: commy2
 * Checks if the player can tap a shoulder.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return value:
 * Able to tap a shoulder <BOOL>
 *
 * Example:
 * [player, target] call ace_interaction_fnc_canTapShoulder
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];

_target isKindOf "CAManBase" &&
{alive _target} &&
{_unit distance _target < 4} &&
{!(_target getVariable ["ACE_isUnconscious", false])} // return
