#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Determine path for projectile to take in accordance to zero-effort miss pro-nav, takes target acceleration into account. Super deadly
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * Commanded acceleration normal to LOS in world space <ARRAY>
 *
 * Example:
 * [] call ace_missileguidance_fnc_navigationType_zeroEffortMiss
 *
 * Public: No
 */
params ["_args", "_timestep", "_seekerTargetPos", "_profileAdjustedTargetPos"];
_args params ["_firedEH", "", "", "", "_stateParams", "_targetData"];
_firedEH params ["","","","","","","_projectile"];
_stateParams params ["", "", "", "","_navigationParams"];
_navigationParams params ["", "_navigationGain"];
_targetData params ["_targetDirection", "_attackProfileDirection", "_targetRange", "_targetVelocity", "_targetAcceleration"];

private _vectorToTarget = _attackProfileDirection vectorMultiply _targetRange;
private _closingVelocity = _targetVelocity vectorDiff velocity _projectile;
private _timeToGo = _targetRange / vectorMagnitude _closingVelocity;

if (_timeToGo == 0) then {
    _timeToGo = 0.001;
};

private _zeroEffortMiss = _vectorToTarget vectorAdd (_closingVelocity vectorMultiply _timeToGo);
private _zeroEffortMissProjectiled = _attackProfileDirection vectorMultiply (_zeroEffortMiss vectorDotProduct _attackProfileDirection);
private _zeroEffortMissNormal = _zeroEffortMiss vectorDiff _zeroEffortMissProjectiled;

private _commandedAcceleration = _zeroEffortMissNormal vectorMultiply (_navigationGain / (_timeToGo * _timeToGo));

_commandedAcceleration
