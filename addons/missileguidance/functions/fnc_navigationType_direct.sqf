#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Points directly toward attack profile positon
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * Commanded acceleration normal to LOS in world space <ARRAY>
 *
 * Example:
 * [] call ace_missileguidance_fnc_navigationType_direct
 *
 * Public: No
 */
params ["_args", "", "", "_profileAdjustedTargetPos"];
_args params ["_firedEH"];
_firedEH params ["","","","","","","_projectile"];

_profileAdjustedTargetPos vectorDiff getPosASLVisual _projectile

