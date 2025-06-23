#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Sets up a top-attack profile. If we don't have a target: coast
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * Commanded acceleration normal to LOS in world space <ARRAY>
 *
 * Example:
 * [] call ace_spike_fnc_navigation
 *
 * Public: No
 */
#define ARM_TIME 0.5
params ["_args", "_timestep", "", "_profileAdjustedTargetPos", "", "_navigationParams"];
_args params ["_firedEH", "_launchParams", "_flightParams", "_seekerParams", "_stateParams", "_targetData", "_navigationStateData"];
_firedEH params ["_shooter","","","","_ammo","","_projectile"];
_launchParams params ["_shooter","_targetLaunchParams","_seekerType","_attackProfile","_lockMode","_laserInfo","_navigationType"];
_targetLaunchParams params ["_target", "_targetPos", "_launchPos", "_launchDir", "_launchTime"];
_flightParams params ["_pitchRate", "_yawRate", "_isBangBangGuidance"];
_stateParams params ["_lastRunTime", "_seekerStateParams", "_attackProfileStateParams", "_lastKnownPosState", "", "_guidanceParameters"];
_seekerParams params ["_seekerAngle", "_seekerAccuracy", "_seekerMaxRange", "_seekerMinRange"];
_targetData params ["_targetDirection", "_attackProfileDirection", "_targetRange", "_targetVelocity", "_targetAcceleration"];

((velocity _projectile) call CBA_fnc_vect2polar) params ["", "_currentYaw", "_currentPitch"];
private _projectilePos = getPosASLVisual _projectile;

if (_navigationParams isEqualTo []) then {
    _navigationParams set [0, STAGE_LAUNCH];
    _navigationParams set [1, CBA_missionTime];
    _navigationParams set [2, 0];
    _navigationParams set [3, 0];
};
_navigationParams params ["_stage", "_launchTime", "_coastAltitude", "_lastAltitudeError"];
private _met = CBA_missionTime - _launchTime;

if (_met >= BATTERY_LIFE) exitWith {
    [0, 0, -_pitchRate]
};

private _navigationDebugStr = "";
private _cmdAccel = [0, 0, 0];

private _2dVelocity = (velocity _projectile);
_2dVelocity set [2, 0];

private _directionToTarget = _projectilePos vectorFromTo _profileAdjustedTargetPos;
private _2dDirectionToTarget = [_directionToTarget#0, _directionToTarget#1, 0];

switch (_stage) do {
    case STAGE_LAUNCH: {
        private _error = LAUNCH_PITCH - _currentPitch;
        _cmdAccel set [2, _error * 3];

        if (_met >= LAUNCH_TIME && abs (_error) <= 5) then {
            _navigationParams set [0, STAGE_CLIMB];
        };
        _navigationDebugStr = format ["SPIKE LAUNCH [Pitch - %1  Error - %2  MET - %3]", _currentPitch, _error, _met];
    };
    case STAGE_CLIMB: {
        private _error = CLIMB_PITCH - _currentPitch;
        _cmdAccel set [2, _error];

        if (_met >= LAUNCH_TIME + CLIMB_TIME && abs (_error) <= 1) then {
            _navigationParams set [0, STAGE_CRUISE];
            _navigationParams set [2, _projectilePos#2];
        };

        _navigationDebugStr = format ["SPIKE CLIMB [Pitch - %1  Error - %2  MET - %3]", _currentPitch, _error, _met];
    };
    case STAGE_CRUISE: {
        private _altitudeError = _coastAltitude - _projectilePos#2;

        private _pY = CRUISE_PRO_GAIN * _altitudeError;
        private _dY = if (_timestep != 0) then {
            CRUISE_DER_GAIN * (_altitudeError - _lastAltitudeError) / _timestep
        } else {
            0
        };
        _navigationParams set [3, _altitudeError];

        _cmdAccel set [2, (_pY + _dY) * _pitchRate];

        if (_profileAdjustedTargetPos isNotEqualTo [0, 0, 0]) then {
            (_2dDirectionToTarget call CBA_fnc_vect2polar) params ["", "_azimuthToTarget"];
            private _yawError = 4 * (_azimuthToTarget - _currentYaw) / 90;
            _yawError = _yawError * _yawRate;
            _cmdAccel set [0, _yawError];
        };

        _navigationDebugStr = format ["SPIKE CRUISE [Altitude - %1  Error - %2  MET - %3]", _projectilePos#2, _altitudeError, _met];
    };
    default {};
};

private _distance = _launchPos vectorDistance _profileAdjustedTargetPos;

private _los = _projectilePos vectorFromTo _profileAdjustedTargetPos;
// subtract 500 so we dont get a perfect top-attack angle
private _ttgo = ((_projectilePos distance2D _profileAdjustedTargetPos) - 500) / (vectorMagnitude velocity _projectile);
private _angleToTarget = acos ((vectorDir _projectile) vectorCos _los);
private _atMinRotationAngle = _angleToTarget >= (_pitchRate * _ttgo);

if (_met >= ARM_TIME && { _stage >= STAGE_LAUNCH } && { _profileAdjustedTargetPos isNotEqualTo [0, 0, 0] } && { _atMinRotationAngle }) then {
    _navigationParams set [0, STAGE_TERMINAL];
};

#ifdef DEBUG_MODE_FULL
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,1,0,1], (ASLToAGL _projectilePos) vectorAdd [0, 0, 5], 0.75, 0.75, 0, _navigationDebugStr, 1, 0.025, "TahomaB"];
#endif

_projectile vectorModelToWorldVisual _cmdAccel
