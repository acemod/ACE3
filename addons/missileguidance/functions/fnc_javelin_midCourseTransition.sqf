#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Condition to switch to next navigation profile
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_javelin_midCourseTransition
 *
 * Public: No
 */
#define STAGE_LAUNCH 1
#define STAGE_CLIMB 2
#define STAGE_COAST 3
#define STAGE_TERMINAL 4

#define REQUIRED_STABLE_TIME 0.2
#define REQUIRED_ANGLE 1

params ["_args", "_timestep"];
_args params ["_firedEH", "_launchParams", "_flightParams", "_seekerParams", "_stateParams", "_targetData", "_navigationStateData"];
_firedEH params ["_shooter","","","","_ammo","","_projectile"];
_launchParams params ["_shooter","_targetLaunchParams","_seekerType","_attackProfile","_lockMode","_laserInfo","_navigationType"];
_targetLaunchParams params ["_target", "_targetPos", "_launchPos", "_launchDir", "_launchTime"];
_flightParams params ["_pitchRate", "_yawRate", "_isBangBangGuidance"];
_stateParams params ["_lastRunTime", "_seekerStateParams", "_attackProfileStateParams", "_lastKnownPosState","_navigationParams", "_guidanceParameters"];
_seekerParams params ["_seekerAngle", "_seekerAccuracy", "_seekerMaxRange", "_seekerMinRange"];
_targetData params ["_targetDirection", "_attackProfileDirection", "_targetRange", "_targetVelocity", "_targetAcceleration"];

_attackProfileStateParams params ["_state", "_stableTime", "_target"];
private _projectileDirection = vectorNormalized velocity _projectile;
private _targetDirection = (getPosASLVisual _projectile) vectorFromTo _target;
private _angle = _projectileDirection vectorCos _targetDirection;
if (_angle > cos REQUIRED_ANGLE) then {
    _stableTime = _stableTime + _timestep;
} else {
    _stableTime = 0;
};

_attackProfileStateParams set [1, _stableTime];
_state isEqualTo STAGE_TERMINAL && _stableTime > REQUIRED_STABLE_TIME

