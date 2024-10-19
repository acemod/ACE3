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

_navigationParams params ["_proportionalGain", "", "_derivativeGain", "_lastErrorX", "_lastErrorY", "_correctionDistance"];
private _relativeTargetDirection = [0, (velocityModelSpace _projectile) select 1, 0] vectorAdd (_projectile vectorWorldToModelVisual (_targetDir vectorMultiply _distance));

private _angleX = ((_relativeTargetDirection select 0) atan2 (_relativeTargetDirection select 1));
private _angleY = ((_relativeTargetDirection select 2) atan2 (_relativeTargetDirection select 1));

private _pX = _proportionalGain * _angleX;
private _dX = 0;
if (_timestep > 0) then {
    _dX = _derivativeGain * (_angleX - _lastErrorX) / _timestep;
};

private _pY = _proportionalGain * _angleY;
private _dY = 0;
if (_timestep > 0) then {
    _dY = _derivativeGain * (_angleY - _lastErrorY) / _timestep;
};

private _accelerationX = _pX + _dX;
private _accelerationY = _pY + _dY;

private _commandedAcceleration = [
    _accelerationX,
    0,
    _accelerationY
];

_navigationParams set [3, _angleX];
_navigationParams set [4, _angleY];

_projectile vectorModelToWorldVisual _commandedAcceleration;
