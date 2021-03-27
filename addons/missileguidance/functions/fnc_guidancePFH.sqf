#include "script_component.hpp"
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

BEGIN_COUNTER(guidancePFH);

#define TIMESTEP_FACTOR 0.01

params ["_args", "_pfID"];
_args params ["_firedEH", "_launchParams", "_flightParams", "_seekerParams", "_stateParams"];
_firedEH params ["_shooter","","","","_ammo","","_projectile"];
_launchParams params ["","_targetLaunchParams"];
_stateParams params ["_lastRunTime", "_seekerStateParams", "_attackProfileStateParams", "_lastKnownPosState", "_pidData"];

if (!alive _projectile || isNull _projectile || isNull _shooter) exitWith {
    [_pfID] call CBA_fnc_removePerFrameHandler;
    END_COUNTER(guidancePFH);
};

private _runtimeDelta = diag_tickTime - _lastRunTime;
private _adjustTime = 1;

if (accTime > 0) then {
    _adjustTime = 1/accTime;
    _adjustTime = _adjustTime *  (_runtimeDelta / TIMESTEP_FACTOR);
    TRACE_4("Adjust timing", 1/accTime, _adjustTime, _runtimeDelta, (_runtimeDelta / TIMESTEP_FACTOR) );
} else {
    _adjustTime = 0;
};

private _minDeflection = ((_flightParams select 0) - ((_flightParams select 0) * _adjustTime)) max 0;
private _maxDeflection = (_flightParams select 1) * _adjustTime;
// private _incDeflection = _flightParams select 2; // todo

private _projectilePos = getPosASLVisual _projectile;

// Run seeker function:
private _seekerTargetPos = [[0,0,0], _args, _seekerStateParams, _lastKnownPosState] call FUNC(doSeekerSearch);

// Run attack profile function:
private _profileAdjustedTargetPos = [_seekerTargetPos, _args, _attackProfileStateParams] call FUNC(doAttackProfile);

// If we have no seeker target, then do not change anything
// If there is no deflection on the missile, this cannot change and therefore is redundant. Avoid calculations for missiles without any deflection
if ((_minDeflection != 0 || {_maxDeflection != 0}) && {_profileAdjustedTargetPos isNotEqualTo [0,0,0]}) then {
    // Get a commanded acceleration via proportional navigation (https://youtu.be/Osb7anMm1AY)
    // Use a simple PID controller to get the desired pitch, yaw, and roll
    // Simulate moving servos by moving in each DOF by a fixed amount per frame
    // Then setVectorDirAndUp to allow ARMA to translate the velocity to whatever PhysX says

    private _rollDegreesPerSecond = 30;
    private _yawDegreesPerSecond = 30;
    private _pitchDegreesPerSecond = 30;

    private _proportionalGain = 1;
    private _integralGain = 0;
    private _derivativeGain = 0;

    _pidData params ["_pid", "_lastTargetDetails", "_lastLineOfSight", "_currentPitchYawRoll"];
    _currentPitchYawRoll params ["_pitch", "_yaw", "_roll"];
    _lastTargetDetails params ["_lastTargetPosition", "_lastTargetVelocity"];

    private _navigationGain = 3;
    private _targetVelocity = (_seekerTargetPos vectorDiff _lastTargetPosition) vectorMultiply (1 / TIMESTEP_FACTOR);
    private _targetAcceleration = (_targetVelocity vectorDiff _lastTargetVelocity) vectorMultiply (1 / TIMESTEP_FACTOR);

    private _lineOfSight = _projectile vectorWorldToModelVisual vectorNormalized (_profileAdjustedTargetPos vectorDiff _projectilePos);
    private _losNormal = [(_lineOfSight#2), -(_lineOfSight#0), 0];

    private _deltaLOS = _lineOfSight vectorDiff _lastLineOfSight;
    private _rotationRate = vectorMagnitude _deltaLOS;
    private _closingVelocity = -_rotationRate;

    private _lateralAcceleration = _navigationGain * _rotationRate * _closingVelocity;
    private _commandedAcceleration = _losNormal vectorMultiply _lateralAcceleration;
    //_commandedAcceleration = _commandedAcceleration vectorAdd (_losNormal vectorMultiply (_navigationGain * 0.5 * TIMESTEP_FACTOR * (9.81 + 150)));

    //systemChat str vectorMagnitude _targetAcceleration;

    TRACE_5("PN", CBA_missionTime, _lineOfSight, _lastLineOfSight, _rotationRate, _deltaLOS);

    private _acceleration = [0, 0];
    {
        (_pid select _forEachIndex) params ["", "_lastDerivative", "_integral"];
        // think about this in xz plane where x = yaw, z = pitch

        private _commandedAccelerationAxis = _commandedAcceleration select _forEachIndex;

        private _proportional = _commandedAccelerationAxis * _proportionalGain;

        private _d0 = _commandedAccelerationAxis * _derivativeGain;
        private _derivative = (_d0 - _lastDerivative) / TIMESTEP_FACTOR;

        _integral = _integral + (_d0 * TIMESTEP_FACTOR * _integralGain);

        private _pidSum = _proportional + _integral + _derivative;

        (_pid select _forEachIndex) set [1, _d0];
        (_pid select _forEachIndex) set [2, _integral];

        _acceleration set [_forEachIndex, _pidSum];
    } forEach _acceleration;

    #ifdef DRAW_GUIDANCE_INFO
    TRACE_1("",_acceleration);
    private _projectilePosAGL = ASLToAGL _projectilePos;
    private _debugAcceleration = [_acceleration#0, 0, _acceleration#1];
    drawLine3D [_projectilePosAGL, _projectilePosAGL vectorAdd (_lineOfSight vectorMultiply 15), [1, 0, 0, 1]];
    drawLine3D [_projectilePosAGL, _projectilePosAGL vectorAdd (_lastLineOfSight vectorMultiply 5), [0, 1, 0, 1]];
    drawLine3D [_projectilePosAGL, _projectilePosAGL vectorAdd ([_lineOfSight#2, -(_lineOfSight#0), 0] vectorMultiply 5), [0, 0, 1, 1]];

    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], [0, 0, 4] vectorAdd ASLtoAGL _projectilePos, 0.75, 0.75, 0, str _rotationRate, 1, 0.025, "TahomaB"];
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], [0, 0, 3] vectorAdd ASLtoAGL _projectilePos, 0.75, 0.75, 0, str vectorMagnitude _targetAcceleration, 1, 0.025, "TahomaB"];
    #endif

    if (!isGamePaused && accTime > 0) then {
        _acceleration params ["_pitchChange", "_yawChange"];

        private _clampedPitch = (-_pitchChange min _pitchDegreesPerSecond) max -_pitchDegreesPerSecond;
        private _clampedYaw = (_yawChange min _yawDegreesPerSecond) max -_yawDegreesPerSecond;

        _pitch = _pitch + _clampedPitch * TIMESTEP_FACTOR;
        _yaw = _yaw + _clampedYaw * TIMESTEP_FACTOR;

        [_projectile, _pitch, _yaw, 0] call FUNC(changeMissileDirection);

        _currentPitchYawRoll set [0, _pitch];
        _currentPitchYawRoll set [1, _yaw];
    };

    _pidData set [0, _pid];
    if (accTime > 0) then {
        _pidData set [1, [_seekerTargetPos, _targetVelocity]];
    };
    _pidData set [2, _lineOfSight];
    _pidData set [3, _currentPitchYawRoll];
    _stateParams set [4, _pidData];
    _args set [4, _stateParams];
};

#ifdef DRAW_GUIDANCE_INFO
TRACE_3("",_projectilePos,_seekerTargetPos,_profileAdjustedTargetPos);
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLtoAGL _projectilePos, 0.75, 0.75, 0, _ammo, 1, 0.025, "TahomaB"];

private _ps = "#particlesource" createVehicleLocal (ASLtoAGL _projectilePos);
_PS setParticleParams [["\A3\Data_f\cl_basic", 8, 3, 1], "", "Billboard", 1, 3.0141, [0, 0, 2], [0, 0, 0], 1, 1.275, 1, 0, [1, 1], [[1, 0, 0, 1], [1, 0, 0, 1], [1, 0, 0, 1]], [1], 1, 0, "", "", nil];
_PS setDropInterval 1.0;
#endif

_stateParams set [0, diag_tickTime];

END_COUNTER(guidancePFH);

