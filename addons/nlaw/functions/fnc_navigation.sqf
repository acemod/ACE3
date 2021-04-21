#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Holds angle as fed to by seeker
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * Commanded acceleration normal to LOS in world space <ARRAY>
 *
 * Example:
 * [] call ace_missileguidance_fnc_navigationType_line
 *
 * Public: No
 */
params ["_args", "_timestep", "_seekerTargetPos", "_profileAdjustedTargetPos", "_targetData", "_navigationParams"];
_args params ["_firedEH"];
_firedEH params ["","","","","","","_projectile"];
_args params ["", "", "_flightParams"];
_flightParams params ["_pitchRate", "_yawRate"];

_navigationParams params ["_yawChange", "_pitchChange", "_startTime"];

_projectile vectorModelToWorldVisual [2 * _yawChange, 0, 2 * _pitchChange]

