#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Returns GPS position. That's it.
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Position of wanted missile pos relative to the camera direction <ARRAY>
 *
 * Example:
 * [] call ace_missileguidance_fnc_seekerType_gps
 *
 * Public: No
 */
params ["", "_args", "_seekerStateParams"];
_args params ["", "", "", "", "", "_targetData"];
(_seekerStateParams select 0) params ["_attackPosition"];
//IGNORE_PRIVATE_WARNING ["_projectile"];

_targetData set [0, (getPosASL _projectile) vectorFromTo _attackPosition];
_targetData set [2, (getPosASL _projectile) distance _attackPosition];
_targetData set [3, [0, 0, 0]];
_targetData set [4, [0, 0, 0]];

_attackPosition

