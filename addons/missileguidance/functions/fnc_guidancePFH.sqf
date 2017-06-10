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
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

BEGIN_COUNTER(guidancePFH);

#define TIMESTEP_FACTOR 0.01

params ["_args", "_pfID"];
_args params ["_firedEH", "_launchParams", "_flightParams", "_seekerParams", "_stateParams"];
_firedEH params ["_shooter","","","","_ammo","","_projectile"];
_launchParams params ["","_targetLaunchParams"];
_stateParams params ["_lastRunTime", "_seekerStateParams", "_attackProfileStateParams", "_lastKnownPosState"];

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

private _projectilePos = getPosASL _projectile;

// Run seeker function:
private _seekerTargetPos = [[0,0,0], _args, _seekerStateParams, _lastKnownPosState] call FUNC(doSeekerSearch);

// Run attack profile function:
private _profileAdjustedTargetPos = [_seekerTargetPos, _args, _attackProfileStateParams] call FUNC(doAttackProfile);

// If we have no seeker target, then do not change anything
if (!(_profileAdjustedTargetPos isEqualTo [0,0,0])) then {

    private _targetVector = _projectilePos vectorFromTo _profileAdjustedTargetPos;
    private _adjustVector = _targetVector vectorDiff (vectorDir _projectile);
    _adjustVector params ["_adjustVectorX", "_adjustVectorY", "_adjustVectorZ"];

    private _yaw = 0;
    private _pitch = 0;
    private _roll = 0;

    if (_adjustVectorX < 0) then {
        _yaw = - ( (_minDeflection max ((abs _adjustVectorX) min _maxDeflection) ) );
    } else {
        if (_adjustVectorX > 0) then {
            _yaw = ( (_minDeflection max (_adjustVectorX min _maxDeflection) ) );
        };
    };
    if (_adjustVectorY < 0) then {
        _roll = - ( (_minDeflection max ((abs _adjustVectorY) min _maxDeflection) ) );
    } else {
        if (_adjustVectorY > 0) then {
            _roll = ( (_minDeflection max (_adjustVectorY min _maxDeflection) ) );
        };
    };
    if (_adjustVectorZ < 0) then {
        _pitch = - ( (_minDeflection max ((abs _adjustVectorZ) min _maxDeflection) ) );
    } else {
        if (_adjustVectorZ > 0) then {
            _pitch = ( (_minDeflection max (_adjustVectorZ min _maxDeflection) ) );
        };
    };
    private _finalAdjustVector = [_yaw, _roll, _pitch];

    TRACE_3("", _pitch, _yaw, _roll);
    TRACE_3("", _targetVector, _adjustVector, _finalAdjustVector);

    if (accTime > 0) then {
        private _changeVector = (vectorDir _projectile) vectorAdd _finalAdjustVector;
        TRACE_2("",_projectile,_changeVector);
        [_projectile, _changeVector] call FUNC(changeMissileDirection);
    };
};

#ifdef DRAW_GUIDANCE_INFO
TRACE_3("",_projectilePos,_seekerTargetPos,_profileAdjustedTargetPos);
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLtoAGL _projectilePos, 0.75, 0.75, 0, _ammo, 1, 0.025, "TahomaB"];

private _ps = "#particlesource" createVehicleLocal (ASLtoAGL _projectilePos);
_PS setParticleParams [["\A3\Data_f\cl_basic", 8, 3, 1], "", "Billboard", 1, 3.0141, [0, 0, 2], [0, 0, 0], 1, 1.275, 1, 0, [1, 1], [[1, 0, 0, 1], [1, 0, 0, 1], [1, 0, 0, 1]], [1], 1, 0, "", "", nil];
_PS setDropInterval 3.0;
#endif

_stateParams set [0, diag_tickTime];

END_COUNTER(guidancePFH);

