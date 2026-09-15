#include "..\script_component.hpp"
/*
 * Author: jaynus / nou
 * Attack profile: AIR
 * TODO: falls back to Linear
 *
 * Arguments:
 * 0: Seeker Target PosASL <ARRAY>
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[1,2,3], [], []] call ace_missileguidance_fnc_attackProfile_AIR;
 *
 * Public: No
 */

params ["_seekerTargetPos", "_args"];
_args params ["_firedEH", "_launchParams", "_flightParams", "_seekerParams", "_stateParams"];
_firedEH params ["_shooter","","","","_ammo","","_projectile"];
_launchParams params ["_shooter","_targetLaunchParams","_seekerType","_attackProfile","_lockMode","_laserInfo","_navigationType"];
_targetLaunchParams params ["_target", "_targetPos", "_launchPos", "_launchDir", "_launchTime"];
_flightParams params ["_pitchRate", "_yawRate", "_isBangBangGuidance"];
_stateParams params ["_lastRunTime", "_seekerStateParams", "_attackProfileStateParams", "_lastKnownPosState","_navigationParams"];
_seekerParams params ["_seekerAngle", "_seekerAccuracy", "_seekerMaxRange", "_seekerMinRange"];

if (_seekerTargetPos isEqualTo [0, 0, 0]) exitWith {
    _seekerTargetPos
};

private _projectilePos = getPosASLVisual _projectile;
private _distanceToTarget2d = _projectilePos distance2D _seekerTargetPos;

private _closingRate = vectorMagnitude velocity _projectile;
private _timeToGo = (_projectilePos distance _seekerTargetPos) / _closingRate;

// we could do stuff like desired attack angle, but I'm not going that far today
private _los = vectorNormalized (_seekerTargetPos vectorDiff _projectilePos);

private _angleToTarget = acos ((vectorDir _projectile) vectorCos _los);
private _atMinRotationAngle = _angleToTarget >= (0.5 * _pitchRate * _timeToGo);

private _returnTargetPos = _seekerTargetPos;

if (!_atMinRotationAngle && _distanceToTarget2d >= 500 && _timeToGo >= 10) then {
    // 10 degree pitch up
    _returnTargetPos = _seekerTargetPos vectorAdd [0, 0, (_projectilePos distance _seekerTargetPos) * sin 10];
};

_returnTargetPos
