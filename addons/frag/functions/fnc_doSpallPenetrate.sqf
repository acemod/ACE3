#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger,
 * This function creates spalling if a projectile penetrated a surface and was slowed down enough proportional to the caliber.
 * It is dissimilar in function from fnc_doSpallHitPart, but leveraging the "Penetrated" projectile EH to process faster.
 *
 * Arguments:
 * Arguments are the same as BI's "Penetratred" EH:
 * https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Penetrated
 *
 * Return Value:
 * None
 *
 * Example:
 * [BIS_PENETRATED_EH_ARGS] call ace_frag_fnc_doSpallPenetrate;
 *
 * Public: No
 */
#define EPSILON 0.1

TRACE_1("doSpallPenetration",_this);
if (CBA_missionTime < GVAR(nextSpallAllowTime)) exitWith {
    TRACE_1("timeExit",_this);
};
params ["_projectile", "_hitObject", "_surfaceType", "", "_spallPosASL", "_newVelocity"];

private _ammo = typeOf _projectile;
if (_spallPosASL isEqualTo [0,0,0] ||
    {_ammo isEqualTo ""} ||
    {_hitObject isKindOf "CAManBase"}) exitWith {
    TRACE_4("time/invalidHit",CBA_missionTime,GVAR(nextSpallAllowTime),_hitObject,_spallPosASL);
};

private _material = _surfaceType call FUNC(getMaterialInfo);
if (_material == "ground") exitWith {
    #ifdef DEBUG_MODE_FULL
    systemChat "ground spall";
    #endif
};

_ammo call FUNC(getSpallInfo) params ["_caliber", "_explosive", "_indirectHit"];
private _velocityChange = velocity _projectile vectorDiff _newVelocity;
private _speedChange = vectorMagnitude _velocityChange;
/*
 * This is all fudge factor since real spalling is too complex for calculation.
 * The equation takes taking a quasi scale of energy using caliber and change in speed.
 */
private _spallPower = ACE_FRAG_SPALL_CALIBER_COEF * _caliber * sqrt _speedChange * GVAR(spallIntensity);
TRACE_5("found speed",_velocityChange,_speedChange,_caliber,_spallPower,_material);

if (_spallPower < ACE_FRAG_SPALL_POWER_MIN) exitWith {
    TRACE_1("lowImpulse",_ammo);
};
private _spallDirection = vectorNormalized _velocityChange;

#ifdef DEBUG_MODE_DRAW
if GVAR(dbgSphere) then {
    [_spallPosASL, "green"] call FUNC(dev_sphereDraw);
};
#endif

private _spawnSize = switch (true) do {
    case (_spallPower < ACE_FRAG_SPALL_POWER_TINY_MAX): {"_spall_tiny"};
    case (_spallPower < ACE_FRAG_SPALL_POWER_SMALL_MAX): {"_spall_small"};
    case (_spallPower < ACE_FRAG_SPALL_POWER_MEDIUM_MAX): {"_spall_medium"};
    case (_spallPower < ACE_FRAG_SPALL_POWER_LARGE_MAX): {"_spall_large"};
    default {"_spall_huge"};
};
GVAR(nextSpallAllowTime) = CBA_missionTime + ACE_FRAG_SPALL_HOLDOFF;

// Solve for one of the vectors normal to _spallDirection on y = 0 plane
private _spallVectorUp = [0, 0, 1];
if (_spallDirection#2 > EPSILON) then {
    private _newZ = _spallDirection#0 / _spallDirection#2;
    _spallVectorUp = vectorNormalized [1, 0, -_newZ];
};

private _spallSpawner = createVehicleLocal [
    QUOTE(GLUE(ADDON,_)) + _material + _spawnSize,
    ASLToAGL _spallPosASL,
    [],
    0,
    "CAN_COLLIDE"
];
_spallSpawner setVectorDirAndUp [_spallDirection, _spallVectorUp];
_spallSpawner setVelocityModelSpace [0, _speedChange * ACE_FRAG_SPALL_VELOCITY_INHERIT_COEFF, 0];
TRACE_4("dir&up",_spallDirection,vectorDir _spallSpawner,_spallVectorUp,vectorUp _spallSpawner);

TRACE_3("createSpallSpawner",speed _spallSpawner,_material + _spawnSize,_spallPower);
#ifdef DEBUG_MODE_DRAW
_spallSpawner addEventHandler [
    "SubmunitionCreated",
    {
        params ["", "_subProj"];
        [_subProj, "purple", true] call FUNC(dev_trackObj);
    }
];
#endif
