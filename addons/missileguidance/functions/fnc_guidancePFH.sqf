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

#define TIMESTEP_FACTOR diag_deltaTime

params ["_args", "_pfID"];
_args params ["_firedEH", "_launchParams", "_flightParams", "_seekerParams", "_stateParams"];
_firedEH params ["_shooter","","","","_ammo","","_projectile"];
_launchParams params ["","_targetLaunchParams"];
_stateParams params ["_lastRunTime", "_seekerStateParams", "_attackProfileStateParams", "_lastKnownPosState", "_navigationParameters"];

if (!alive _projectile || isNull _projectile || isNull _shooter) exitWith {
    [_pfID] call CBA_fnc_removePerFrameHandler;
    END_COUNTER(guidancePFH);
};

_flightParams params ["_pitchRate", "_yawRate"];

// Run seeker function:
private _seekerTargetPos = [[0,0,0], _args, _seekerStateParams, _lastKnownPosState] call FUNC(doSeekerSearch);
// Run attack profile function:
_seekerTargetPos = AGLtoASL ASLToAGL _seekerTargetPos;
private _profileAdjustedTargetPos = [_seekerTargetPos, _args, _attackProfileStateParams] call FUNC(doAttackProfile);

private _projectilePos = getPosASLVisual _projectile;

// If we have no seeker target, then do not change anything
// If there is no deflection on the missile, this cannot change and therefore is redundant. Avoid calculations for missiles without any deflection
if ((_pitchRate != 0 || {_yawRate != 0}) && {_profileAdjustedTargetPos isNotEqualTo [0,0,0]}) then {
    private _commandedAcceleration = [_args, TIMESTEP_FACTOR, _seekerTargetPos, _profileAdjustedTargetPos] call FUNC(navigationType_proNav);

    #ifdef DRAW_GUIDANCE_INFO
    private _projectilePosAGL = ASLToAGL _projectilePos;
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], _projectilePosAGL vectorAdd [0, 0, 1], 0.75, 0.75, 0, str _commandedAcceleration, 1, 0.025, "TahomaB"];
    drawLine3D [_projectilePosAGL, _projectilePosAGL vectorAdd _commandedAcceleration, [1, 0, 1, 1]];
    #endif

    // activate missile servos and change direction
    if (!isGamePaused && accTime > 0) then {
        _navigationParameters params ["", "_currentPitchYawRoll"];
        _currentPitchYawRoll params ["_yaw", "_roll", "_pitch"];

        _commandedAcceleration = _projectile vectorWorldToModelVisual _commandedAcceleration;
        _commandedAcceleration params ["_yawChange", "", "_pitchChange"];
        
        private _clampedPitch = (_pitchChange min _pitchRate) max -_pitchRate;
        private _clampedYaw = (_yawChange min _yawRate) max -_yawRate;

        TRACE_9("pitch/yaw/roll",_pitch,_yaw,_roll,_yawChange,_pitchChange,_pitchRate,_yawRate,_clampedPitch,_clampedYaw);

        _pitch = _pitch + _clampedPitch * TIMESTEP_FACTOR;
        _yaw = _yaw + _clampedYaw * TIMESTEP_FACTOR;

        TRACE_3("new pitch/yaw/roll",_pitch,_yaw,_roll);
        
        [_projectile, _pitch, _yaw, 0] call FUNC(changeMissileDirection);
        _projectile setVelocityModelSpace [0, vectorMagnitude velocity _projectile, 0];

        _currentPitchYawRoll set [0, _yaw];
        _currentPitchYawRoll set [2, _pitch];

        _navigationParameters set [1, _currentPitchYawRoll];
    };

    _stateParams set [4, _navigationParameters];
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

