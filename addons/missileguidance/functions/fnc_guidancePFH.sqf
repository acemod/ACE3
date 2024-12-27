#include "..\script_component.hpp"
/*
 * Author: jaynus / nou
 * Guidance Per Frame Handler
 *
 * Arguments:
 * 0: Guidance Arg Array <ARRAY>
 * 1: PFID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[], 0] call ace_missileguidance_fnc_guidancePFH;
 *
 * Public: No
 */
#define TRAIL_COLOUR(multiplier) [1 * multiplier, 1 * multiplier, 0.3 * multiplier, 0.7 * multiplier]

BEGIN_COUNTER(guidancePFH);

params ["_args", "_pfID"];
_args params ["_firedEH", "_launchParams", "_flightParams", "_seekerParams", "_stateParams", "_targetData", "_navigationStateParams"];
_firedEH params ["_shooter","","","","_ammo","","_projectile"];
_launchParams params ["","_targetLaunchParams","","","","","_navigationType"];
_stateParams params ["_lastRunTime", "_seekerStateParams", "_attackProfileStateParams", "_lastKnownPosState", "_navigationParameters", "_guidanceParameters"];
_navigationStateParams params ["_currentState", "_navigationStateData"];
_flightParams params ["_pitchRate", "_yawRate", "_isBangBangGuidance", "_stabilityCoefficient", "_showTrail"];

if (!alive _projectile || isNull _projectile || isNull _shooter) exitWith {
    [_pfID] call CBA_fnc_removePerFrameHandler;
    END_COUNTER(guidancePFH);
};

if (_showTrail) then {
    drop ["\a3\data_f\kouleSvetlo", "", "Billboard",  100, 0.03, _projectile modelToWorld [0, 0, 0],
        [0, 0, 0], 0, 1.25, 1, 0.05, [0.5], [TRAIL_COLOUR(1)], [0], 0, 0, "", "", "", 0, false, -1, [TRAIL_COLOUR(10000)]];
};

private _timestep = diag_deltaTime * accTime;

// Run seeker function:
private _seekerTargetPos = [[0,0,0], _args, _seekerStateParams, _lastKnownPosState, _timestep] call FUNC(doSeekerSearch);
// Run attack profile function:
_seekerTargetPos = AGLToASL ASLToAGL _seekerTargetPos;
private _profileAdjustedTargetPos = [_seekerTargetPos, _args, _attackProfileStateParams, _timestep] call FUNC(doAttackProfile);

private _projectilePos = getPosASLVisual _projectile;
_targetData set [1, _projectilePos vectorFromTo _profileAdjustedTargetPos];

// If we have no seeker target, then do not change anything
// If there is no deflection on the missile, this cannot change and therefore is redundant. Avoid calculations for missiles without any deflection
if ((_pitchRate != 0 || {_yawRate != 0}) && {_profileAdjustedTargetPos isNotEqualTo [0,0,0]}) then {
    private _navigationFunction = getText (configFile >> QGVAR(NavigationTypes) >> _navigationType >> "functionName");
    if (_navigationStateData isNotEqualTo []) then {
        (_navigationStateData select _currentState) params ["_transitionCondition"];
        private _transition = ([_args, _timestep] call (missionNamespace getVariable [_transitionCondition, { false }]));
        if (_transition) then {
            _currentState = _currentState + 1;
            _navigationStateParams set [0, _currentState];
        };

        _navigationType = (_navigationStateData select _currentState) select 1;
        _navigationFunction = getText (configFile >> QGVAR(NavigationTypes) >> _navigationType >> "functionName");

        _navigationParameters = (_navigationStateData select _currentState) select 2;
        _stateParams set [4, _navigationParameters];
    };
    private _commandedAcceleration = [_args, _timestep, _seekerTargetPos, _profileAdjustedTargetPos, _targetData, _navigationParameters] call (missionNamespace getVariable _navigationFunction);

    if (isNil "_commandedAcceleration") exitWith {
        systemChat format ["Error in %1 Missile Type %2 Seeker Pos %3", _navigationFunction, typeOf _projectile, _seekerTargetPos];
        ERROR_MSG_3("_commandedAcceleration is nil! Guidance cancelled [%1 %2 %3]",_navigationFunction,typeOf _projectile,_seekerTargetPos);
    };

    if (GVAR(debug_drawGuidanceInfo)) then {
        private _projectilePosAGL = ASLToAGL _projectilePos;
        private _cmdAccelLocal = _projectile vectorWorldToModelVisual _commandedAcceleration;
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], _projectilePosAGL vectorAdd [0, 0, 1], 0.75, 0.75, 0, format ["cmdPitch: %1 cmdYaw %2", _cmdAccelLocal#2, _cmdAccelLocal#0], 1, 0.025, "TahomaB"];
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,1,0,1], _projectilePosAGL vectorAdd [0, 0, 2], 0.75, 0.75, 0, _navigationType, 1, 0.025, "TahomaB"];
        drawLine3D [_projectilePosAGL, _projectilePosAGL vectorAdd _commandedAcceleration, [1, 0, 1, 1]];
    };

    // activate missile servos and change direction
    if (!isGamePaused && accTime > 0) then {
        _guidanceParameters params ["_yaw", "_roll", "_pitch"];

        _commandedAcceleration = _projectile vectorWorldToModelVisual _commandedAcceleration;
        _commandedAcceleration params ["_yawChange", "", "_pitchChange"];

        if (isNil "_yawChange") then {
            _yawChange = 0;
        };
        if (isNil "_pitchChange") then {
            _pitchChange = 0;
        };

        private _clampedPitch = (_pitchChange min _pitchRate) max -_pitchRate;
        private _clampedYaw = (_yawChange min _yawRate) max -_yawRate;

        // controls are either on or off, no proportional
        if (_isBangBangGuidance) then {
            private _pitchSign = if (_clampedPitch == 0) then {
                0
            } else {
                _clampedPitch / abs _clampedPitch
            };
            private _yawSign = if (_clampedYaw == 0) then {
                0
            } else {
                _clampedYaw / abs _clampedYaw
            };
            _clampedPitch = _pitchSign * _pitchRate;
            _clampedYaw = _yawSign * _yawRate;
        };

        TRACE_9("pitch/yaw/roll",_pitch,_yaw,_roll,_yawChange,_pitchChange,_pitchRate,_yawRate,_clampedPitch,_clampedYaw);
        // directional stability
        private _localVelocity = _projectile vectorWorldToModelVisual (velocity _projectile);

        private _velocityAngleYaw = (_localVelocity#0) atan2 (_localVelocity#1);
        private _velocityAnglePitch = (_localVelocity#2) atan2 (_localVelocity#1);

        // bastardized version of direction stability https://en.wikipedia.org/wiki/Directional_stability#Steering_forces
        private _forceYaw = _stabilityCoefficient * _velocityAngleYaw + _clampedYaw;
        private _forcePitch = _stabilityCoefficient * _velocityAnglePitch + _clampedPitch;

        _pitch = _pitch + _forcePitch * _timestep;
        _yaw = _yaw + _forceYaw * _timestep;

        TRACE_3("new pitch/yaw/roll",_pitch,_yaw,_roll);

        private _multiplyQuat = {
            params ["_qLHS", "_qRHS"];
            _qLHS params ["_lhsX", "_lhsY", "_lhsZ", "_lhsW"];
            _qRHS params ["_rhsX", "_rhsY", "_rhsZ", "_rhsW"];

            private _lhsImaginary = [_lhsX, _lhsY, _lhsZ];
            private _rhsImaginary = [_rhsX, _rhsY, _rhsZ];

            private _scalar = _lhsW * _rhsW - (_lhsImaginary vectorDotProduct _rhsImaginary);
            private _imginary = (_rhsImaginary vectorMultiply _lhsW) vectorAdd (_lhsImaginary vectorMultiply _rhsW) vectorAdd (_lhsImaginary vectorCrossProduct _rhsImaginary);

            _imginary + [_scalar]
        };

        private _multiplyVector = {
            params ["_quaternion", "_vector"];

            private _real = _quaternion#3;
            private _imaginary = [
                _quaternion#0,
                _quaternion#1,
                _quaternion#2
            ];

            private _vectorReturn = _vector vectorAdd ((
                _imaginary vectorCrossProduct (
                    (_imaginary vectorCrossProduct _vector) vectorAdd (
                        _vector vectorMultiply _real
                    )
                )
            ) vectorMultiply 2);

            _vectorReturn
        };

        private _quaternion = [0, 0, 0, 1];

        private _temp = [0, 0, sin (-_yaw / 2), cos (-_yaw / 2)];
        _quaternion = [_quaternion, _temp] call _multiplyQuat;

        _temp = [sin (_pitch / 2), 0, 0, cos (_pitch / 2)];
        _quaternion = [_quaternion, _temp] call _multiplyQuat;

        private _dir = [_quaternion, [0, 1, 0]] call _multiplyVector;
        private _up = [_quaternion, [0, 0, 1]] call _multiplyVector;

        _projectile setVectorDirAndUp [_dir, _up];

        _guidanceParameters set [0, _yaw];
        _guidanceParameters set [2, _pitch];

        _stateParams set [5, _guidanceParameters];
    };

    _stateParams set [4, _navigationParameters];
    _args set [4, _stateParams];
};

if (GVAR(debug_drawGuidanceInfo)) then {
    TRACE_3("",_projectilePos,_seekerTargetPos,_profileAdjustedTargetPos);
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLToAGL _projectilePos, 0.75, 0.75, 0, _ammo, 1, 0.025, "TahomaB"];

    if (!isGamePaused && accTime > 0) then {
        private _ps = "#particlesource" createVehicleLocal (ASLToAGL _projectilePos);
        _PS setParticleParams [["\A3\Data_f\cl_basic", 8, 3, 1], "", "Billboard", 1, 3.0141, [0, 0, 0], [0, 0, 0], 1, 1.275, 1, 0, [1, 1], [[1, 0, 0, 1], [1, 0, 0, 1], [1, 0, 0, 1]], [1], 1, 0, "", "", nil];
        _PS setDropInterval 1.0;
    };

    drawLine3D [ASLToAGL _projectilePos, (ASLToAGL _projectilePos) vectorAdd velocity _projectile, [1, 1, 1, 1]];
};

_stateParams set [0, diag_tickTime];

END_COUNTER(guidancePFH);
