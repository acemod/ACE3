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

_miscManeuvering params ["_degreesPerSecond","_lastRunTime"];
_miscSensor params ["_seekerAngle", "_seekerMinRange", "_seekerMaxRange"];

if (!alive _projectile || isNull _projectile || isNull _shooter) exitWith {
    [_pfID] call CBA_fnc_removePerFrameHandler;
    END_COUNTER(guidancePFH);
};

private _runtimeDelta = diag_tickTime - _lastRunTime;
private _adjustTime = 1;

if (accTime > 0) then {
    _adjustTime = 1/accTime;
    _adjustTime = _adjustTime *  (_runtimeDelta);
    _miscManeuvering set [1, diag_tickTime];
} else {
    _adjustTime = 0;
};

_projPos = getposASL _projectile;


// Seeker Search
private _seekerTargetPos = [_projectile, _shooter, _extractedInfo] call FUNC(runSeekerSearch);

// Attack Profile Search
private _attackProfileTargetPos = [_projectile, _shooter, _extractedInfo, _seekerTargetPos] call FUNC(runAttackProfile);
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLtoAGL _projPos, 0.75, 0.75, 0, _ammo, 1, 0.025, "TahomaB"];

// Fuze Check
if ([_projectile, _miscFuze] call FUNC(checkFuze)) exitWith {
    [_pfID] call CBA_fnc_removePerFrameHandler;
    END_COUNTER(guidancePFH);
    triggerAmmo _projectile;
};

if (_attackProfileTargetPos isEqualTo [0,0,0]) exitWith {};

_fuseMisc set [0, true];

drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,1,0,1], ASLtoAGL _seekerTargetPos, 0.75, 0.75, 0, _seekerType, 1, 0.025, "TahomaB"];
drawLine3D [(ASLtoAGL _projPos), (ASLtoAGL _seekerTargetPos), [1,1,0,1]];
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,0,1,1], ASLtoAGL _attackProfileTargetPos, 0.75, 0.75, 0, _attackProfile, 1, 0.025, "TahomaB"];
drawLine3D [(ASLtoAGL _projPos), (ASLtoAGL _attackProfileTargetPos), [1,0,1,1]];

_degreesPerFrame = _degreesPerSecond * _runtimeDelta * _adjustTime;

// Adjust projectile direction
_crossVector = (vectorDir _projectile) vectorCrossProduct (_projPos vectorFromTo _attackProfileTargetPos);
_totalAngleToTarget = acos( ((vectorDir _projectile) vectorDotProduct (_projPos vectorFromTo _attackProfileTargetPos)) min 1 );
_angleToTurn = _totalAngleToTarget min _degreesPerFrame;
hint format ["%1", _totalAngleToTarget];
_v = [vectorDir _projectile, _crossVector, _angleToTurn] call CBA_fnc_vectRotate3D;

private _l = sqrt ((_v select 0) ^ 2 + (_v select 1) ^ 2);
if(_l == 0) then {
    _projectile setVectorDirAndUp [ _v, [0,1,0] ];
} else {
    private _r = -(_v select 2) / _l;
    _projectile setVectorDirAndUp [ _v, [(_v select 0) * _r,(_v select 1) * _r, _l] ];
};
_projectile setVelocity ((_v vectorMultiply (vectorMagnitude (velocity _projectile))) vectorAdd [0,0,-9.80665 * _runtimeDelta]);
