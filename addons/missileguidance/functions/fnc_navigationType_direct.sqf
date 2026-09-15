#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Points directly toward attack profile position
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
params ["_args", "_timestep", "", "_profileAdjustedTargetPos"];
_args params ["_firedEH", "", "_flightParams"];
_flightParams params ["_pitchRate", "_yawRate"];
_firedEH params ["","","","","","","_projectile"];

private _projectilePos = getPosASLVisual _projectile;

private _targetDirection = _projectilePos vectorFromTo _profileAdjustedTargetPos;
private _projectileDirection = vectorNormalized velocity _projectile;

private _deltaDirection = _targetDirection vectorDiff _projectileDirection;
_deltaDirection = _projectile vectorWorldToModelVisual _deltaDirection;
_deltaDirection = _deltaDirection vectorMultiply [_yawRate, 0, _pitchRate];
_deltaDirection = _projectile vectorModelToWorldVisual _deltaDirection;

private _iTimestep = 0;
if (_timestep != 0) then {
    _iTimestep = 1 / _timestep;
};
_deltaDirection vectorMultiply _iTimestep // return
