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

// Run seeker function:
private _seekerTargetPos = [[0,0,0], _args, _seekerStateParams, _lastKnownPosState] call FUNC(doSeekerSearch);

// Run attack profile function:
private _profileAdjustedTargetPos = [_seekerTargetPos, _args, _attackProfileStateParams] call FUNC(doAttackProfile);

private _projectilePos = getPosASLVisual _projectile;

// If we have no seeker target, then do not change anything
// If there is no deflection on the missile, this cannot change and therefore is redundant. Avoid calculations for missiles without any deflection
if ((_minDeflection != 0 || {_maxDeflection != 0}) && {_profileAdjustedTargetPos isNotEqualTo [0,0,0]}) then {
    // Get a commanded acceleration via proportional navigation (https://youtu.be/Osb7anMm1AY)
    // Use a simple PID controller to get the desired pitch, yaw, and roll
    // Simulate moving servos by moving in each DOF by a fixed amount per frame
    // Then setVectorDirAndUp to allow ARMA to translate the velocity to whatever PhysX says

    private _rollDegreesPerSecond = 60;
    private _yawDegreesPerSecond = 60;
    private _pitchDegreesPerSecond = 60;

    private _proportionalGain = 1;
    private _integralGain = 0;
    private _derivativeGain = 0;

    private _projectileVelocity = velocity _projectile;
    private _projectileSpeed = vectorMagnitude _projectileVelocity;

    _pidData params ["_pid", "_lastMissileFrame", "_currentPitchYawRoll"];
    _currentPitchYawRoll params ["_pitch", "_yaw", "_roll"];
    _lastMissileFrame params ["_lastTargetPosition", "_lastTargetVelocity", "_lastLineOfSight"];

    // Proportional navigation implemented via "Fundamentals of proportional navigation" by Stephen Murtaugh and Harry Criel
    private _navigationGain = 3;
    // integrate target velocity for realistic inference of velocity
    private _targetVelocity = (_seekerTargetPos vectorDiff _lastTargetPosition) vectorMultiply (1 / diag_deltaTime);
    private _targetAcceleration = (_targetVelocity vectorDiff _lastTargetVelocity) vectorMultiply (1 / diag_deltaTime);

    private _closingVelocity = _targetVelocity vectorDiff _projectileVelocity;

    private _lineOfSight = vectorNormalized (_profileAdjustedTargetPos vectorDiff _projectilePos);

    // the los rate is tiny, so we multiply by a constant of a power of ten to get more aggressive acceleration
    // this is just due to how we measure our LOS delta, the vectors involved are _tiny_
    private _losDelta = _lineOfSight vectorDiff _lastLineOfSight;
    private _losRate = 1000 * (vectorMagnitude _losDelta) / TIMESTEP_FACTOR;

    private _lateralAcceleration = (_navigationGain * _losRate);
    private _commandedAcceleration = _closingVelocity vectorMultiply _lateralAcceleration;

    // we need acceleration normal to our LOS
    private _commandedAccelerationProjected = _lineOfSight vectorMultiply (_commandedAcceleration vectorDotProduct _lineOfSight);
    _commandedAcceleration = _commandedAcceleration vectorDiff _commandedAccelerationProjected;

    #ifdef DRAW_GUIDANCE_INFO
    private _projectilePosAGL = ASLToAGL _projectilePos;
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], _projectilePosAGL vectorAdd [0, 0, 1], 0.75, 0.75, 0, str _commandedAcceleration, 1, 0.025, "TahomaB"];
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLToAGL (_seekerTargetPos vectorAdd _targetVelocity), 0.75, 0.75, 0, "Predicted Position", 1, 0.025, "TahomaB"];

    drawLine3D [_projectilePosAGL, _projectilePosAGL vectorAdd _commandedAcceleration, [1, 0, 1, 1]];

    private _seekerPosAGL = ASLToAGL _seekerTargetPos;
    drawLine3D [_seekerPosAGL, _seekerPosAGL vectorAdd _targetVelocity, [0, 1, 1, 1]];
    drawLine3D [_seekerPosAGL, _seekerPosAGL vectorAdd (_projectilePos vectorDiff _seekerTargetPos), [0, 1, 1, 1]];
    #endif

    if (!isGamePaused && accTime > 0) then {
        _commandedAcceleration = _projectile vectorWorldToModelVisual _commandedAcceleration;
        _commandedAcceleration params ["_yawChange", "", "_pitchChange"];
        
        private _clampedPitch = (_pitchChange min _pitchDegreesPerSecond) max -_pitchDegreesPerSecond;
        private _clampedYaw = (_yawChange min _yawDegreesPerSecond) max -_yawDegreesPerSecond;

        _pitch = _pitch + _clampedPitch * diag_deltaTime;
        _yaw = _yaw + _clampedYaw * diag_deltaTime;
        
        [_projectile, _pitch, _yaw, 0] call FUNC(changeMissileDirection);
        _projectile setVelocityModelSpace [0, _projectileSpeed, 0];

        _currentPitchYawRoll set [0, _pitch];
        _currentPitchYawRoll set [1, _yaw];
    };

    _pidData set [0, _pid];
    if (accTime > 0) then {
        _pidData set [1, [_seekerTargetPos, _targetVelocity, _lineOfSight]];
    };
    _pidData set [2, _currentPitchYawRoll];
    _stateParams set [4, _pidData];
    _args set [4, _stateParams];
};

#ifdef DRAW_GUIDANCE_INFO
TRACE_3("",_projectilePos,_seekerTargetPos,_profileAdjustedTargetPos);
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLtoAGL _projectilePos, 0.75, 0.75, 0, _ammo, 1, 0.025, "TahomaB"];

if (!isGamePaused && accTime > 0) then {
    private _ps = "#particlesource" createVehicleLocal (ASLtoAGL _projectilePos);
    _PS setParticleParams [["\A3\Data_f\cl_basic", 8, 3, 1], "", "Billboard", 1, 3.0141, [0, 0, 2], [0, 0, 0], 1, 1.275, 1, 0, [1, 1], [[1, 0, 0, 1], [1, 0, 0, 1], [1, 0, 0, 1]], [1], 1, 0, "", "", nil];
    _PS setDropInterval 1.0;
};
#endif

_stateParams set [0, diag_tickTime];

END_COUNTER(guidancePFH);

