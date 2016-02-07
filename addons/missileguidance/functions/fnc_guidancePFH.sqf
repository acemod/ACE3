//#define DEBUG_MODE_FULL
#include "script_component.hpp"

#define TIMESTEP_FACTOR 0.01

private["_launchParams", "_targetLaunchParams", "_flightParams", "_seekerParams", "_stateParams"];
private["_lastRunTime", "_runtimeDelta", "_adjustTime", "_args", "_seekerTargetPos", "_projectilePos"];
private["_profileAdjustedTargetPos", "_incDeflection", "_minDeflection", "_maxDeflection"];
private["_targetVector", "_adjustVector", "_finalAdjustVector", "_changeVector", "_pitch", "_yaw", "_roll"];
private["_PS", "_distanceToTarget", "_targetRelativeVector", "_vectorTo"];

_args = _this select 0;
EXPLODE_7_PVT((_args select 0),_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);

if(!alive _projectile || isNull _projectile || isNull _shooter) exitWith {
    [(_this select 1)] call CBA_fnc_removePerFrameHandler;
};

_launchParams = _args select 1;
_targetLaunchParams = _launchParams select 1;
_flightParams = _args select 2;
_seekerParams = _args select 3;

_stateParams = _args select 4;

_lastRunTime = _stateParams select 0;
_runtimeDelta = ACE_diagTime - _lastRunTime;
_adjustTime = 1;

if(accTime > 0) then {
    _adjustTime = 1/accTime;
    _adjustTime = _adjustTime *  (_runtimeDelta / TIMESTEP_FACTOR);
    TRACE_4("Adjust timing", 1/accTime, _adjustTime, _runtimeDelta, (_runtimeDelta / TIMESTEP_FACTOR) );
} else {
    _adjustTime = 0;
};

_minDeflection = ((_flightParams select 0) - ((_flightParams select 0) * _adjustTime)) max 0;
_maxDeflection = (_flightParams select 1) * _adjustTime;
_incDeflection = _flightParams select 2;

_projectilePos = getPosASL _projectile;

// @TODO: placeholder for "last seek target position"
// Last target pos should be optional based on the seeker unit
_seekerTargetPos = [ [0,0,0], _args, (_stateParams select 1)] call FUNC(doSeekerSearch);
if(isNil "_seekerTargetPos") then {
    _seekerTargetPos = _seekerTargetPos vectorAdd ((velocity _projectile) vectorMultiply 5);
} else {
    if( (vectorMagnitude _seekerTargetPos) == 0) then {
       _seekerTargetPos = _seekerTargetPos vectorAdd ((velocity _projectile) vectorMultiply 5);
    };
};

_profileAdjustedTargetPos = [_seekerTargetPos,_args, (_stateParams select 2)] call FUNC(doAttackProfile);
_targetVector = _projectilePos vectorFromTo _profileAdjustedTargetPos;
_adjustVector = _targetVector vectorDiff (vectorDir _projectile);

_yaw = 0;
_pitch = 0;
_roll = 0;    
if((_adjustVector select 0) < 0) then {
    _yaw = - ( (_minDeflection max (abs(_adjustVector select 0) min _maxDeflection) ) );
} else {
    if((_adjustVector select 0) > 0) then {
        _yaw = ( (_minDeflection max ((_adjustVector select 0) min _maxDeflection) ) );
    };
};
if((_adjustVector select 1) < 0) then {
    _roll = - ( (_minDeflection max (abs(_adjustVector select 1) min _maxDeflection) ) );
} else {
    if((_adjustVector select 1) > 0) then {
        _roll = ( (_minDeflection max ((_adjustVector select 1) min _maxDeflection) ) );
    };
};
if((_adjustVector select 2) < 0) then {
    _pitch = - ( (_minDeflection max (abs(_adjustVector select 2) min _maxDeflection) ) );
} else {
    if((_adjustVector select 2) > 0) then {
        _pitch = ( (_minDeflection max ((_adjustVector select 2) min _maxDeflection) ) );
    };
};
_finalAdjustVector = [_yaw, _roll, _pitch];
TRACE_2("", _pitch, _yaw);
TRACE_4("", _targetVector, _targetRelativeVector, _adjustVector, _finalAdjustVector);

if(accTime > 0) then {
    _changeVector = (vectorDir _projectile) vectorAdd _finalAdjustVector;
    [_projectile, _changeVector] call FUNC(changeMissileDirection);
};

#ifdef DEBUG_MODE_FULL
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,1,1,1], ASLtoATL _projectilePos, 0.75, 0.75, 0, str _vectorTo, 1, 0.025, "TahomaB"];
drawLine3D [ASLtoATL _projectilePos, ASLtoATL _profileAdjustedTargetPos, [1,0,0,1]];

_ps = "#particlesource" createVehicleLocal (ASLtoATL _projectilePos);
_PS setParticleParams [["\A3\Data_f\cl_basic", 8, 3, 1], "", "Billboard", 1, 3.0141, [0, 0, 2], [0, 0, 0], 1, 1.275, 1, 0, [1, 1], [[1, 0, 0, 1], [1, 0, 0, 1], [1, 0, 0, 1]], [1], 1, 0, "", "", nil];
_PS setDropInterval 3.0;

hintSilent format["d: %1", _distanceToTarget];
#endif

_stateParams set[0, ACE_diagTime];

_args set[4, _stateParams];
_this set[0, _args];