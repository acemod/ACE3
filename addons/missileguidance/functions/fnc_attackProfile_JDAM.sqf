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
_attackProfileStateParams params ["_gpsData", "_initialProjectileHeight", "_terminal"];
_gpsData params ["", "_impactAngle", "_attackDirection"];
_targetData params ["_directionToTarget", "", "_distanceToTarget"];
_flightParams params ["_pitchRate", "_yawRate"];

if (_impactAngle <= 0) then {
	_impactAngle = 360; // immediate pitch over to attack
};

if (_attackDirection < 0) then {
	_attackDirection = direction _projectile;
};

private _projectilePos = getPosASLVisual _projectile;
private _projectilePitch = ((vectorDir _projectile) call CBA_fnc_vect2polar) select 2;
private _targetDir = _projectilePos vectorFromTo _seekerTargetPos;

private _targetPos = _seekerTargetPos;
if !(_terminal) then {
	_targetPos = [
		_targetPos#0,
		_targetPos#1,
		(_seekerTargetPos select 2) + 500
	];
	
	private _lineDir = [1, 180 + _attackDirection, _impactAngle] call CBA_fnc_polar2vect;

	private _v = _projectilePos vectorDiff _seekerTargetPos;
	private _d = _v vectorDotProduct _lineDir;
	private _closestPoint = _seekerTargetPos vectorAdd (_lineDir vectorMultiply _d);

	private _timeToGo = (_projectilePos distance _closestPoint) / vectorMagnitude velocity _projectile;

	private _projectileAngleFromTarget = acos ((vectorDir _projectile) vectorCos _targetDir);
	private _availablePitch = _pitchRate * _timeToGo;

	private _neededPitch = _impactAngle + _projectilePitch;

	private _atMinRotationAngle = _availablePitch <= _neededPitch;
	_attackProfileStateParams set [2, (_atMinRotationAngle || (_neededPitch <= _projectileAngleFromTarget))];

	if (GVAR(debug_drawGuidanceInfo)) then {
		_attackProfileName = format ["JDAM [Pitch Available - %1 Needed Pitch - %2 TTP - %3]", _availablePitch, _neededPitch, (_availablePitch - _neededPitch) / _pitchRate];
		drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLtoAGL _closestPoint, 0.75, 0.75, 0, "P", 1, 0.025, "TahomaB"];
	};
} else {
	_attackProfileName = format ["JDAM [Pitch - %1  Impact Pitch - %2]", _projectilePitch, _impactAngle];
};

if (GVAR(debug_drawGuidanceInfo)) then {
	private _desiredAngle = [5000, 180 + _attackDirection, _impactAngle] call CBA_fnc_polar2vect;
	private _targetPosAGL = ASLtoAGL _seekerTargetPos;
	drawLine3D [_targetPosAGL, _targetPosAGL vectorAdd _desiredAngle, [1, 1, 1, 1]];
};

_targetPos;

