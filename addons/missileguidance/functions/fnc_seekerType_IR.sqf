#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Infrared seeker. Checks if flares are popped
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Position of wanted missile pos relative to the camera direction <ARRAY>
 *
 * Example:
 * [] call ace_missileguidance_fnc_seekerType_IR
 *
 * Public: No
 */
#ifdef DEBUG_MODE_FULL
#define TRACK_ON_PAUSE true
#else
#define TRACK_ON_PAUSE false
#endif

_args params ["_firedEH", "_launchParams", "_flightParams", "_seekerParams", "_stateParams", "_targetData"];
_firedEH params ["_shooter","","","","_ammo","","_projectile"];
_launchParams params ["_shooter","_targetLaunchParams","_seekerType","_attackProfile","_lockMode","_laserInfo","_navigationType"];
_targetLaunchParams params ["_target", "_targetPos", "_launchPos", "_launchDir", "_launchTime"];
_flightParams params ["_pitchRate", "_yawRate", "_isBangBangGuidance"];
_stateParams params ["_lastRunTime", "_seekerStateParams", "_attackProfileStateParams", "_lastKnownPosState","_navigationParams", "_guidanceParameters"];
_seekerParams params ["_seekerAngle", "_seekerAccuracy", "_seekerMaxRange", "_seekerMinRange"];
_targetData params ["_targetDirection", "_attackProfileDirection", "_targetRange", "_targetVelocity", "_targetAcceleration"];

_seekerStateParams params ["_flareDistanceFilter", "_flareAngleFilter", "_trackingTarget"];

private _projectileVelocity = velocity _projectile;
private _closingVelocity = _targetVelocity vectorDiff _projectileVelocity;

private _withinView = [_projectile, getPosASLVisual _trackingTarget, _seekerAngle] call FUNC(checkSeekerAngle);
private _canSee = [_projectile, _trackingTarget, false] call FUNC(checkLos);

if (!_withinView || !_canSee) then {
	_trackingTarget = objNull;
};

if (isNull _trackingTarget) then {
	// find any target within seeker range
	private _potentialTargets = _projectile nearEntities ["Air", _seekerMaxRange];
	private _bestAngle = 90;
	{
		private _withinView = [_projectile, getPosASLVisual _x, _seekerAngle] call FUNC(checkSeekerAngle);
		private _canSee = [_projectile, _x, false] call FUNC(checkLos);

		if (_withinView && _canSee) then {
			private _los = (getPosASLVisual _projectile) vectorFromTo (getPosASLVisual _x);
			private _losAngle = (_los#2 atan2 _los#0);
			if (_losAngle < _bestAngle) then {
				_trackingTarget = _x;
				_bestAngle = _losAngle;
			};
		};
	} forEach _potentialTargets;
};

if (TRACK_ON_PAUSE || {accTime > 0 && !isGamePaused}) then {
	// If there are flares nearby, check if they will confuse missile
	private _nearby = _trackingTarget nearObjects 50;
	_nearby = _nearby select {
		// 2 = IR blocking
		private _blocking = configOf _x >> "weaponLockSystem";
		private _isFlare = false;
		if (isNumber _blocking) then {
			_isFlare = (2 == getNumber _blocking);
		};

		if (isText _blocking) then {
			_isFlare = ("2" in getText _blocking);
		};

		private _withinView = [_projectile, getPosASLVisual _x, _seekerAngle] call FUNC(checkSeekerAngle);
		private _canSee = [_projectile, _x, false] call FUNC(checkLos);

		(_x isEqualTo _target && _trackingTarget isNotEqualTo _target) || { (_withinView && _canSee && _isFlare) }
	};
	
	private _foundDecoy = false;
	{
		if (_trackingTarget isNotEqualTo _x) then {
			private _considering = false;

			private _distanceToFlare = _trackingTarget distanceSqr _x;
			if !(_foundDecoy) then {
				private _flareRelativeVelocity = (velocity _x) vectorDiff _projectileVelocity;
				private _angleBetweenVelocities = acos (_closingVelocity vectorCos _flareRelativeVelocity);

				systemChat str [_angleBetweenVelocities, _flareAngleFilter];
				if (_angleBetweenVelocities <= _flareAngleFilter) then {
						_considering = true;
						if (_seekerAccuracy <= random 1) then {
							_trackingTarget = _x;
							_foundDecoy = true;
						};
					};
			};

			#ifdef DRAW_GUIDANCE_INFO
			private _flarePos = ASLToAGL getPosASLVisual _x;
			private _colour = [1, 0, 0, 1];
			if (_considering) then {
				_colour = [0, 1, 0, 1];
			};
			if (_trackingTarget isEqualTo _x) then {
				_colour = [0, 0, 1, 1];
			};
			drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", _colour, _flarePos, 0.75, 0.75, 0, "F", 1, 0.025, "TahomaB"];
			#endif
		};
	} forEach _nearby;

	_seekerStateParams set [2, _trackingTarget];
	
};

private _targetPosition = _trackingTarget modelToWorldVisualWorld getCenterOfMass _trackingTarget;

_targetData set [0, (getPosASL _projectile) vectorFromTo _targetPosition];
_targetData set [2, 0];
_targetData set [3, velocity _trackingTarget];

_targetPosition
