#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Assumes targetDir is pointing toward line we want to stay on
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
_args params ["_firedEH", "", "_flightParams"];
_firedEH params ["","","","","","","_projectile"];
_targetData params ["", "_targetDir", "_distance"];
_flightParams params ["_pitchRate", "_yawRate"];

_navigationParams params ["_pid_x", "_pid_y"];
private _relativeTargetDirection = [0, (velocityModelSpace _projectile) select 1, 0] vectorAdd (_projectile vectorWorldToModelVisual (_targetDir vectorMultiply _distance));

private _angleX = ((_relativeTargetDirection select 0) atan2 (_relativeTargetDirection select 1));
private _angleY = ((_relativeTargetDirection select 2) atan2 (_relativeTargetDirection select 1));

private _accelerationX = [_pid_x, -_angleX] call CBA_pid_fnc_update;
private _accelerationY = [_pid_y, -_angleY] call CBA_pid_fnc_update;

private _commandedAcceleration = [
    _accelerationX,
    0,
    _accelerationY
];

_projectile vectorModelToWorldVisual _commandedAcceleration;
