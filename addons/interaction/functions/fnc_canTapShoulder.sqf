#include "..\script_component.hpp"
/*
 * Author: commy2
 * Checks if the player can tap a shoulder.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Able to tap a shoulder <BOOL>
 *
 * Example:
 * [player, target] call ace_interaction_fnc_canTapShoulder
 *
 * Public: No
 */

params ["_unit", "_target"];

_target isKindOf "CAManBase" &&
{_target call EFUNC(common,isAwake)} &&
{_unit distance _target < 4} // return
