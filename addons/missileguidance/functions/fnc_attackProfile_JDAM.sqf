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
params ["_seekerTargetPos", "_args", "_attackProfileStateParams"];
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

private _targetPos = _seekerTargetPos;
if !(_terminal) then {
	_targetPos set [2, (_seekerTargetPos select 2) + 500];
	private _timeToGo = ((getPosASL _projectile) distance _targetPos) / vectorMagnitude velocity _projectile;

	private _pitchTime = 0.5 * _pitchRate * _timeToGo;

	private _atMinRotationAngle = _pitchTime <= _impactAngle;
	_attackProfileStateParams set [2, _atMinRotationAngle];

	if (GVAR(debug_drawGuidanceInfo)) then {
		_attackProfileName = format ["JDAM [%1]", _pitchTime];
	};
};

if (GVAR(debug_drawGuidanceInfo)) then {
	private _desiredAngle = [5000, 180 + _attackDirection, _impactAngle] call CBA_fnc_polar2vect;
	private _projectilePosAGL = ASLtoAGL _seekerTargetPos;
	drawLine3D [_projectilePosAGL, _projectilePosAGL vectorAdd _desiredAngle, [1, 0, 0, 1]];
};

_targetPos;

