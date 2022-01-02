#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
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
_args params ["", "", "_flightParams"];
_targetData params ["", "_targetDir", "_distance"];
_flightParams params ["_pitchRate", "_yawRate"];

_navigationParams params ["_proportionalGain", "", "_derivativeGain", "_lastErrorX", "_lastErrorY", "_correctionDistance"];
private _targetDistance = _projectile vectorWorldToModelVisual (_targetDir vectorMultiply _distance);

_proportionalGain = 30;
_derivativeGain = 30;
_correctionDistance = 3;
private _errorX = _targetDistance#0 / _correctionDistance;
private _errorY = _targetDistance#2 / _correctionDistance;

private _pX = _proportionalGain * _errorX;
private _dX = if (_timestep != 0) then {
    _derivativeGain * (_errorX - _lastErrorX) / _timestep
} else {
    0
};

private _pY = _proportionalGain * _errorY;
private _dY = if (_timestep != 0) then {
    _derivativeGain * (_errorY - _lastErrorY) / _timestep
} else {
    0
};

private _accelerationX = _pX + _dX;
private _accelerationY = _pY + _dY;

private _commandedAcceleration = [
    _accelerationX,
    0,
    _accelerationY
];

_navigationParams set [3, _errorX];
_navigationParams set [4, _errorY];

_projectile vectorModelToWorldVisual _commandedAcceleration;
