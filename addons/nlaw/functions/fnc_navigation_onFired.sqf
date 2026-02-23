#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Sets up missile guidance state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * Navigation Parameters <ARRAY>
 *
 * Example:
 * [] call ace_nlaw_fnc_onFired
 *
 * Public: No
 */
#define PROPORTIONAL 1.588
#define INTEGRAL 0.358
#define DERIVATIVE 1.255
#define HISTORY_LENGTH 30

params ["_firedEH", "_launchParams", "_flightParams", "_seekerParams", "_stateParams"];
_firedEH params ["_shooter","","","","","","_projectile"];
_launchParams params ["","_targetLaunchParams","","_attackProfile"];
_targetLaunchParams params ["_target"];
_stateParams params ["", "", "", "", "_navigationParams"];
_flightParams params ["_pitchRate", "_yawRate"];
// Reset _launchPos origin as projectile's height instead of player's foot
_targetLaunchParams set [2, getPosASL _projectile];

// Get state params:
TRACE_3("start of attack profile",_attackProfile,_shooter,vectorDir _projectile);

private _firedLOS = _shooter weaponDirection (currentWeapon _shooter);
private _yawChange = 0;
private _pitchChange = 0;

if (_shooter == ACE_player) then {
    TRACE_2("isPlayer",GVAR(yawChange),GVAR(pitchChange));
    _yawChange = GVAR(yawChange);
    _pitchChange = GVAR(pitchChange);
    TRACE_1("los check",_firedLOS call CBA_fnc_vect2Polar);
} else {
    if ((!isNil "_target") && {!isNull _target}) then {
        _firedLOS = (getPosASL _projectile) vectorFromTo (aimPos _target);
        (((eyePos _shooter) vectorFromTo (aimPos _target)) call CBA_fnc_vect2Polar) params ["", "_startYaw", "_startPitch"];
        // Add some random error to AI's velocity prediction:
        private _random = random [(_shooter skillFinal "aimingAccuracy") min 0.9, 1, 2-((_shooter skillFinal "aimingAccuracy") min 0.9)];
        (((eyePos _shooter) vectorFromTo ((aimPos _target) vectorAdd ((velocity _target) vectorMultiply (_random)))) call CBA_fnc_vect2Polar) params ["", "_predictedYaw", "_predictedPitch"];
        _yawChange = ([_predictedYaw - _startYaw] call CBA_fnc_simplifyAngle180);
        _pitchChange = ([_predictedPitch - _startPitch] call CBA_fnc_simplifyAngle180);
        TRACE_1("AI",_target);
    } else {
        TRACE_1("AI - no target",_target);
    };
};

// Limit Max Deflection
//_yawChange = -10 max _yawChange min 10;
//_pitchChange = -10 max _pitchChange min 10;

private _velocity = velocity _projectile;
private _forwardVelocity = [_velocity select 0, _velocity select 1, 0];
private _currentPitch = (_velocity select 2) atan2 vectorMagnitude _forwardVelocity;
private _currentYaw = (_velocity select 0) atan2 (_velocity select 1);
(_firedLOS call CBA_fnc_vect2Polar) params ["", "_yaw", "_pitch"];

private _additionalPitch = 1 + abs _pitchChange;
private _additionalYaw = 1 + abs _yawChange;

private _pid_pitch = [PROPORTIONAL * _additionalPitch, INTEGRAL, DERIVATIVE * _additionalPitch , 0, -_pitchRate, _pitchRate, HISTORY_LENGTH] call CBA_pid_fnc_create;
private _pid_yaw = [PROPORTIONAL * _additionalYaw, INTEGRAL, DERIVATIVE * _additionalYaw, 0, -_yawRate, _yawRate, HISTORY_LENGTH] call CBA_pid_fnc_create;

TRACE_5("attackProfileStateParams",_firedLOS,_yawChange,_pitchChange,_currentPitch,_currentYaw);
_navigationParams set [0, _pid_pitch];
_navigationParams set [1, _pid_yaw];
_navigationParams set [2, CBA_missionTime];
_navigationParams set [3, _pitchChange];
_navigationParams set [4, _yawChange];
_navigationParams set [5, _pitch];
_navigationParams set [6, _yaw];
_navigationParams

