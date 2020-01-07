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

#define TIMESTEP_FACTOR 0.01

params ["_args", "_pfID"];
_args params ["_firedEH","_extractedInfo"];

_firedEH params ["_shooter","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile"];
_extractedInfo params ["_seekerType", "_attackProfile", "_target", "_targetPos", "_targetVector", "_launchPos", "_miscSeeker", "_miscProfile"];

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

// Fuze Check
if (false) exitWith {
    triggerAmmo _projectile;
    [_pfID] call CBA_fnc_removePerFrameHandler;
    END_COUNTER(guidancePFH);
};

// Seeker Search
private _seekerTargetPos = [_projectile, _shooter, _extractedInfo] call FUNC(runSeekerSearch);

// Attack Profile Search
private _attackProfileTargetPos = [_projectile, _shooter, _extractedInfo, _seekerTargetPos] call FUNC(runAttackProfile);

if (_attackProfileTargetPos isEqualTo [0,0,0]) exitWith {};

// Adjust projectile direction
private _projectilePos = getPosASL _projectile;
private _vectorToTarget = _projectilePos vectorFromTo _attackProfileTargetPos;


//Debug, laser sharp guidance
_projectile setVelocity (_vectorToTarget vectorMultiply (vectorMagnitude (velocity _projectile)));
_projectile setVectorDir (vectorNormalized (velocity _projectile));
