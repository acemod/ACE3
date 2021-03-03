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
_flightParams params ["_minDeflection", "_maxDeflection", "_incDeflection", "_useVanillaDeflection"];
_stateParams params ["_lastRunTime", "_seekerStateParams", "_attackProfileStateParams", "_lastKnownPosState", "_submunitionArray"];

if ((_submunitionArray isNotEqualTo []) && {_args call FUNC(deploySubmunition)}) exitWith {};

if (!alive _projectile || isNull _projectile || isNull _shooter) exitWith {
    [_pfID] call CBA_fnc_removePerFrameHandler;
    END_COUNTER(guidancePFH);
};

private _runtimeDelta = cba_missionTime - _lastRunTime;
_stateParams set [0, cba_missionTime];
private _adjustTime = _runtimeDelta / TIMESTEP_FACTOR;

private _projectilePos = getPosASL _projectile;

// Run seeker function:
private _seekerTargetPos = [[0,0,0], _args, _seekerStateParams, _lastKnownPosState] call FUNC(doSeekerSearch);

// Run attack profile function:
private _profileAdjustedTargetPos = [_seekerTargetPos, _args, _attackProfileStateParams] call FUNC(doAttackProfile);

// If we have no seeker target, then do not change anything
if (_profileAdjustedTargetPos isNotEqualTo [0,0,0]) then {
    if (_useVanillaDeflection) exitWith {
        _projectile setMissileTargetPos ASLtoAGL _profileAdjustedTargetPos;
        #ifdef DRAW_GUIDANCE_INFO
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0.5,1,0,1], ASLtoAGL (missileTargetPos _projectile), 1, 1, diag_tickTime * 60, "", 1, 0.025, "TahomaB"];
        #endif
    };

    _minDeflection = _minDeflection * _adjustTime;
    _maxDeflection = _maxDeflection * _adjustTime;
    // _incDeflection = _flightParams select 2; // todo
    // If there is no deflection on the missile, this cannot change and therefore is redundant. Avoid calculations for missiles without any deflection
    if ((_minDeflection == 0) && {_maxDeflection == 0}) exitWith {};


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

    private _changeVector = (vectorDir _projectile) vectorAdd _finalAdjustVector;
    TRACE_2("",_projectile,_changeVector);
    [_projectile, _changeVector] call FUNC(changeMissileDirection);
};

#ifdef DRAW_GUIDANCE_INFO
TRACE_3("",_projectilePos,_seekerTargetPos,_profileAdjustedTargetPos);
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLtoAGL _projectilePos, 0.75, 0.75, 0, _ammo, 1, 0.025, "TahomaB"];
private _forwardPosition = _projectilePos vectorAdd ((vectorNormalized (velocity _projectile)) vectorMultiply 15);
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0.5,0,1,1], ASLtoAGL _forwardPosition, 0.75, 0.75, 0, 
    format ["V: %1 (%2)", round vectorMagnitude velocity _projectile, round ((velocity _projectile) # 2)], 1, 0.025, "TahomaB"];
drawLine3D [ASLtoAGL _projectilePos, ASLtoAGL _forwardPosition, [0.5,0,1,1]];

if (productVersion #4 != "Diag") then {
    private _ps = "#particlesource" createVehicleLocal (ASLtoAGL _projectilePos);
    _PS setParticleParams [["\A3\Data_f\cl_basic", 8, 3, 1], "", "Billboard", 1, 3.0141, [0, 0, 2], [0, 0, 0], 1, 1.275, 1, 0, [1, 1], [[1, 0, 0, 1], [1, 0, 0, 1], [1, 0, 0, 1]], [1], 1, 0, "", "", nil];
    _PS setDropInterval 3.0;
};
#endif

END_COUNTER(guidancePFH);
