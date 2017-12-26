/*
 * Author: xrufix
 * PFH controlling the Bombs steering input.
 *
 * Arguments:
 * 0: Guidance Arg Array <ARRAY>
 * 1: PFID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[], 0] call ace_bombs_fnc_guidancePFH;
 *
 * Public: No
 */

#include "script_component.hpp"

#define TIMESTEP_FACTOR 0.01

params ["_arguments", "_pfID"];
_arguments params ["_firedParams", "_seekerParams", "_seekerConfig", "_steeringFactor", "_stateParams"];
_firedParams params ["_shooter","","","","_ammo","","_bomb"];
_seekerParams params ["_seekerType", "_laserInfo", "_gpsTarget"];
_seekerConfig params ["_seekerAngle", "_seekerAccuracy", "_seekerMaxRange"];
_stateParams params ["_lastRunTime", "_seekerStateParams", "_lastKnownPosState"];

// End guidance when the bomb exploded or vanished.
if (!alive _bomb or isNull _bomb) exitWith {
	[_pfID] call CBA_fnc_removePerFrameHandler;
};

// Handle time acceleration
private _runtimeDelta = diag_tickTime - _lastRunTime;
private _adjustTime = 1;

if (accTime > 0) then {
    _adjustTime = 1/accTime;
    _adjustTime = _adjustTime *  (_runtimeDelta / TIMESTEP_FACTOR);
    TRACE_4("Adjust timing", 1/accTime, _adjustTime, _runtimeDelta, (_runtimeDelta / TIMESTEP_FACTOR) );
} else {
    _adjustTime = 0;
};

_steeringFactor = _steeringFactor * _adjustTime;

// 
_targetPos = [] call FUNC(findTargetPos);

// Check if a target has been detected.
if !(_targetPos isEqualTo [0,0,0]) then {
	// Check how much the guidance system should steer.
	private _bombDir = vectorDir _bomb;
	private _targetDir = (getPosASL _bomb) vectorFromTo _targetPos;
	private _adjustVector = _targetDir vectorDiff _bombDir;
    _adjustVector params ["_adjustVectorX", "_adjustVectorY", "_adjustVectorZ"];

	private _yaw = if (_adjustVectorX > 0) then {
		_steeringFactor
	} else {
		- _steeringFactor
	};
	private _roll = if (_adjustVectorY > 0) then {
		_steeringFactor
	} else {
		- _steeringFactor
	};
	private _pitch = if (_adjustVectorZ > 0) then {
		_steeringFactor
	} else {
		- _steeringFactor
	};
	_adjustVector = [_yaw, _roll, _pitch];

	// Apply steering to the bomb.
	private _newDir = _bombDir vectorAdd _adjustVector;
	[_bomb,_newDir] call EFUNC(missileguidance,changeMissileDirection);
};

#ifdef DRAW_GUIDANCE_INFO
TRACE_3("",_projectilePos,_seekerTargetPos,_profileAdjustedTargetPos);
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLtoAGL _projectilePos, 0.75, 0.75, 0, _ammo, 1, 0.025, "TahomaB"];

private _ps = "#particlesource" createVehicleLocal (ASLtoAGL _projectilePos);
_PS setParticleParams [["\A3\Data_f\cl_basic", 8, 3, 1], "", "Billboard", 1, 3.0141, [0, 0, 2], [0, 0, 0], 1, 1.275, 1, 0, [1, 1], [[1, 0, 0, 1], [1, 0, 0, 1], [1, 0, 0, 1]], [1], 1, 0, "", "", nil];
_PS setDropInterval 3.0;
#endif
