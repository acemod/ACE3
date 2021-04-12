#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Accelerates toward LOS
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * Commanded acceleration normal to LOS in world space <ARRAY>
 *
 * Example:
 * [] call ace_missileguidance_fnc_navigationType_lineOfSight
 *
 * Public: No
 */
params ["_args", "", "", "_profileAdjustedTargetPos"];
_args params ["_firedEH"];
_firedEH params ["","","","","","","_projectile"];

private _lineOfSight = vectorNormalized (_profileAdjustedTargetPos vectorDiff getPosASLVisual _projectile);
_lineOfSight
