#include "script_component.hpp"
/*
  * Author: LorenLuke, (adopted from framework by: jaynus, nou, pabstmirror)
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

params ["_args", "_pfID"];
_args params ["_firedEH","_extractedInfo"];

_firedEH params ["_shooter","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile"];
_extractedInfo params ["_seekerType", "_attackProfile", "_target", "_targetPos", "_targetVector", "_launchPos", "_launchTime", "_miscManeuvering", "_miscSensor", "_miscSeeker", "_miscProfile", "_miscFuze"];
_miscManeuvering params ["_degreesPerSecond", "_glideAngle", "_lastTickTime", "_lastRunTime", "_runtimeDelta"];
_miscSensor params ["_seekerAngle", "_seekerMinRange", "_seekerMaxRange"];

_miscFuze params ["_fuzeVehicle", "_fuzeAlt", "_fuzeRange", "_fuzeTime", "_fuzeLoc"];


if (!alive _projectile || isNull _projectile || isNull _shooter) exitWith {
    [_pfID] call CBA_fnc_removePerFrameHandler;
    END_COUNTER(guidancePFH);
};

if (time - _launcTime < 0.2) exitWith {

};

_runtimeDelta = diag_tickTime - _lastTickTime;
if(time == _lastRunTime) then {
    _lastRunTime = time;
    _runtimeDelta = 0;
    _lastTickTime = diag_tickTime;
};
private _adjustTime = 1;

if (accTime > 0) then {
    _adjustTime = 1/accTime;
    _miscManeuvering set [2, diag_tickTime];
    _miscManeuvering set [3, time];
} else {
    _adjustTime = 0;
};

_miscManeuvering set [4, _runtimeDelta];

private _projPos = getposASL _projectile;

// Seeker Search
private _seekerTargetPos = [_projectile, _shooter, _extractedInfo] call FUNC(runSeekerSearch);
if (isNil "_seekerTargetPos") then {
    _seekerTargetPos = [0,0,0];
};

// Attack Profile Search
private _attackProfileTargetPos = [_projectile, _shooter, _extractedInfo, _seekerTargetPos] call FUNC(runAttackProfile);
if (isNil "_attackProfileTargetPos") then {
    _attackProfileTargetPos = [0,0,0];
};

drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLtoAGL _projPos, 0.75, 0.75, 0, _ammo, 1, 0.025, "TahomaB"];

// Fuze Check
_fuzeRange set [2, _launchPos distance _projPos]; // Sets our distance fuze distance
if(time - _launchTime > 0.75) then {
    {
        _x set [1, true];
    } forEach _miscFuze;
};

if ([_projectile, _miscFuze] call FUNC(checkFuze)) exitWith {
    [_pfID] call CBA_fnc_removePerFrameHandler;
    END_COUNTER(guidancePFH);
    triggerAmmo _projectile;
};

if (_attackProfileTargetPos isEqualTo [0,0,0]) exitWith {};


drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,1,0,1], ASLtoAGL _seekerTargetPos, 0.75, 0.75, 0, _seekerType, 1, 0.025, "TahomaB"];
drawLine3D [(ASLtoAGL _projPos), (ASLtoAGL _seekerTargetPos), [1,1,0,1]];
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,0,1,1], ASLtoAGL _attackProfileTargetPos, 0.75, 0.75, 0, _attackProfile, 1, 0.025, "TahomaB"];
drawLine3D [(ASLtoAGL _projPos), (ASLtoAGL _attackProfileTargetPos), [1,0,1,1]];

_degreesPerFrame = _degreesPerSecond * _runtimeDelta * _adjustTime;

// Adjust projectile direction

private _crossVector = (vectorNormalized(velocity _projectile)) vectorCrossProduct (_projPos vectorFromTo _attackProfileTargetPos);
private _totalAngleToTarget = acos( ((vectorNormalized(velocity _projectile)) vectorDotProduct (_projPos vectorFromTo _attackProfileTargetPos)) min 1 );
private _angleToTurn = _totalAngleToTarget min _degreesPerFrame;

private _v = [vectorNormalized(velocity _projectile), _crossVector, _angleToTurn] call CBA_fnc_vectRotate3D;


private _l = sqrt ((_v select 0) ^ 2 + (_v select 1) ^ 2);
if(_l == 0) then {
    _projectile setVectorDirAndUp [ _v, [0,_v,0] ];
} else {
    private _r = -(_v select 2) / _l;
    _projectile setVectorDirAndUp [ _v, [(_v select 0) * _r,(_v select 1) * _r, _l] ];
};

_projectile setVelocity ((_v vectorMultiply (vectorMagnitude (velocity _projectile))) vectorAdd ([0,0,-9.80665 * _runtimeDelta]) );
