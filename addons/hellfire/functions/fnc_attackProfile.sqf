#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Hellfire attack profile. Handles all 4 modes LOBL, LOAL-DIR, LOAL-HI, LOAL-LO
 *
 * Arguments:
 * 0: Seeker Target PosASL <ARRAY>
 * 1: Guidance Arg Array <ARRAY>
 * 2: Attack Profile State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[1,2,3], [], []] call ace_hellfire_fnc_attackProfile
 *
 * Public: No
 */

params ["_seekerTargetPos", "_args", "_attackProfileStateParams"];
_args params ["_firedEH", "_launchParams", "_flightParams", "", "_stateParams"];
_stateParams params ["", "_seekerStateParams"];
_launchParams params ["","_targetLaunchParams","_seekerType"];

_targetLaunchParams params ["", "", "_launchPos", "_launchDir"];
_firedEH params ["","","","","","","_projectile"];

// Get state params:
if (_attackProfileStateParams isEqualTo []) then {
    _this call FUNC(getAttackProfileSettings);
};
_attackProfileStateParams params ["_attackStage", "_configLaunchHeightClear", "_missileStateData"];

private _projectilePos = getPosASL _projectile;
private _distanceFromLaunch2d = _launchPos distance2D _projectilePos;
private _heightAboveLaunch = (_projectilePos select 2) - (_launchPos select 2);

// Add height depending on distance for compensate
private _returnTargetPos = _seekerTargetPos;
if (_returnTargetPos isEqualTo [0, 0, 0]) then {
    private _initialDistanceToTarget = 8000;
    _returnTargetPos = _launchPos vectorAdd (_launchDir vectorMultiply _initialDistanceToTarget);
};

private _closingRate = vectorMagnitude velocity _projectile;
// subtract 500 meters to account for the fact that we don't want to be at the perfect pitch exactly when we cross the target
// 500 seemed good in testing
private _timeToGo = ((_projectilePos distance2D _seekerTargetPos) - 500) / _closingRate;

// we could do stuff like desired attack angle, but I'm not going that far today
private _los = _projectilePos vectorFromTo _seekerTargetPos;

_flightParams params ["_pitchRate", "_yawRate"];

private _angleToTarget = acos ((vectorDir _projectile) vectorCos _los);
private _atMinRotationAngle = _angleToTarget >= (_pitchRate * _timeToGo);

switch (_attackStage) do {
    case STAGE_LAUNCH: { // Gain height quickly to pass terrain mask
        _missileStateData params ["_heightBeforeStateSwitch", "_initialDistanceToTarget"];

        _returnTargetPos set [2, _heightBeforeStateSwitch + (_initialDistanceToTarget * sin 20)]; // 100 and 36.4 gives a 20 deg angle

        if (_heightAboveLaunch > _configLaunchHeightClear) then {
            _attackProfileStateParams set [0, STAGE_SEEK_CRUISE];

            _attackProfileStateParams set [2, [_projectilePos select 2, _seekerTargetPos distance2D _projectilePos]];
            TRACE_2("New Stage: STAGE_SEEK_CRUISE",_distanceFromLaunch2d,_heightAboveLaunch);
        };

        if (_atMinRotationAngle) then {
            _attackProfileStateParams set [0, STAGE_ATTACK_TERMINAL];

            _attackProfileStateParams set [2, [_projectilePos select 2, _seekerTargetPos distance2D _projectilePos]];
            TRACE_2("New Stage: STAGE_ATTACK_TERMINAL",_timeToGo,_angleToTarget);
        };
    };
    case STAGE_SEEK_CRUISE: { // Slowly gain altitude while searching for target
        _missileStateData params ["_heightBeforeStateSwitch", "_initialDistanceToTarget"];

        // Before 4000 cruise at 5.7 degrees up, then level out
        _returnTargetPos set [2, _heightBeforeStateSwitch + (_initialDistanceToTarget * sin 5.7)];

        if (_seekerTargetPos isNotEqualTo [0,0,0]) then {
            _attackProfileStateParams set [0, STAGE_ATTACK_CRUISE];

            _attackProfileStateParams set [2, [_projectilePos select 2, _seekerTargetPos distance2D _projectilePos]];
            TRACE_1("New Stage: STAGE_ATTACK_CRUISE",_distanceFromLaunch2d);
        };
    };
    case STAGE_ATTACK_CRUISE: {
        _missileStateData params ["_heightBeforeStateSwitch", "_initialDistanceToTarget"];

        private _currentHeightOverTarget = (_projectilePos select 2) - (_seekerTargetPos select 2);
        private _distanceToTarget2d = _seekerTargetPos distance2D _projectilePos;

        _returnTargetPos set [2, _heightBeforeStateSwitch + (_initialDistanceToTarget * sin 7)];

        // if we are at the rotation limit, rotate to target
        if (_atMinRotationAngle || {(_currentHeightOverTarget atan2 _distanceToTarget2d) > 15}) then { // Wait until we can come down at a sharp angle
            _attackProfileStateParams set [0, STAGE_ATTACK_TERMINAL];

            _attackProfileStateParams set [2, [_projectilePos select 2, _seekerTargetPos distance2D _projectilePos]];
            TRACE_2("New Stage: STAGE_ATTACK_TERMINAL",_distanceToTarget2d,_currentHeightOverTarget);
        };
    };
    case STAGE_ATTACK_TERMINAL: {
    };
};

// missile guidance defines this variable in doAttackProfile
//IGNORE_PRIVATE_WARNING ["_attackProfileName"];
_attackProfileName = ["na", "hellfire - LAUNCH", "hellfire - SEEK CRUISE", "hellfire - ATTACK CRUISE", "hellfire - TERMINAL"] select _attackStage;

TRACE_1("Adjusted target position",_returnTargetPos);
_returnTargetPos;
