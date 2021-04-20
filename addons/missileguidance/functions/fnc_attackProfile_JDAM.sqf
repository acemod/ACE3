#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Attack profile: JDAM
 * Glides until attack angle, and then dives in
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
 * [[1,2,3], [], []] call ace_missileguidance_fnc_attackProfile_jdam;
 *
 * Public: No
 */
params ["_seekerTargetPos", "_args", "_attackProfileStateParams", "_timestep"];
_args params ["_firedEH", "", "_flightParams", "", "", "_targetData"];
_firedEH params ["_shooter","","","","","","_projectile"];
_attackProfileStateParams params ["_gpsData", "_initialProjectileHeight", "_terminal", "_lastAngleToTarget"];
_gpsData params ["", "_impactAngle", "_attackDirection"];
_targetData params ["_directionToTarget", "", "_distanceToTarget"];
_flightParams params ["_pitchRate", "_yawRate"];

if (_impactAngle <= 0) then {
	_impactAngle = 360; // immediate pitch over to attack
};

if (_attackDirection < 0) then {
	_attackDirection = direction _projectile;
};

private _targetPos = _seekerTargetPos;
if !(_terminal) then {
	_targetPos = [
		_targetPos#0,
		_targetPos#1,
		(_seekerTargetPos select 2) + 500
	];

	private _projectilePos = getPosASLVisual _projectile;
	private _timeToGo = (_projectilePos distance _targetPos) / vectorMagnitude velocity _projectile;

	private _currentPitchTowardTarget = ((_projectilePos vectorFromTo _seekerTargetPos) call CBA_fnc_vect2polar) select 2;
	private _closingRate = if (_timestep != 0) then {
		(_currentPitchTowardTarget - _lastAngleToTarget) / _timestep;
	} else {	
		0
	};
	_attackProfileStateParams set [3, _currentPitchTowardTarget];

	private _pitchTime = _pitchRate * _timeToGo;

	private _projectileElevation = ((vectorDir _projectile) call CBA_fnc_vect2polar) select 2;
	private _neededPitch = (_impactAngle + _projectileElevation + _closingRate);
	private _pitchOverETA = _timeToGo - ((_impactAngle + _projectileElevation) / _pitchRate);

	// TODO: look into PID controller and custom navigation type to ride the line? Same as SACLOS really

	private _atMinRotationAngle = _pitchTime <= _neededPitch;
	_attackProfileStateParams set [2, _atMinRotationAngle];

	if (GVAR(debug_drawGuidanceInfo)) then {
		_attackProfileName = format ["JDAM [Pitch Available - %1 Needed Pitch - %2 ETP - %3]", _pitchTime, _neededPitch, _pitchOverETA];
	};
};

if (GVAR(debug_drawGuidanceInfo)) then {
	private _desiredAngle = [5000, 180 + _attackDirection, _impactAngle] call CBA_fnc_polar2vect;
	private _targetPosAGL = ASLtoAGL _seekerTargetPos;
	drawLine3D [_targetPosAGL, _targetPosAGL vectorAdd _desiredAngle, [1, 1, 1, 1]];
};

_targetPos;

