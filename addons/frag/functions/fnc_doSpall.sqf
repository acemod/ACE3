#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger,
 * This function creates spalling if the hit slowed the projectile speed down enough.
 *
 * Arguments:
 * Arguments are the same as BI's "HitPart" EH:
 * https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#HitPart
 *
 * Return Value:
 * None
 *
 * Example:
 * [BIS_HITPART_EH_ARGS] call ace_frag_fnc_doSpall;
 *
 * Public: No
 */

#define GLUE(g1,g2) g1##g2

if (CBA_missionTime < GVAR(nextSpallAllowTime)) exitWith {
    TRACE_2("time exit",CBA_missionTime,GVAR(nextSpallAllowTime));
};

params ["_projectile", "_objectHit", "_lastPosASL", "_lastVelocity", "_surfaceNorm", "_surfaceType", "_ammo", "_shotParents", "_vectorUp"];
TRACE_9("doSpall",_projectile,_objectHit,_lastPosASL,_lastVelocity,_surfaceNorm,_surfaceType,_ammo,_shotParents,_vectorUp);

if (_ammo == "" || {_objectHit isKindOf "CAManBase"}) exitWith {
    TRACE_4("invalid round or hit",CBA_missionTime,GVAR(nextSpallAllowTime),_objectHit,_lastPosASL);
};

private _material = [_surfaceType] call FUNC(getMaterialInfo);
if (_material == "ground") exitWith {
    #ifdef DEBUG_MODE_FULL
    systemChat "ground spall";
    #endif
};

// Find spall speed / fragment info
[_ammo] call FUNC(getSpallInfo) params ["_caliber", "_explosive", "_indirectHit"];
private _vel = if (alive _projectile) then {
    _explosive = 0; // didn't explode since it's alive a frame later
    velocity _projectile
} else {
    [0, 0, 0]
};

private _speedChange = 0 max (vectorMagnitude _lastVelocity - vectorMagnitude _vel);
/*
 * This is all fudge factor since real spalling is too complex for calculation.
 * There are two terms. The first is from round impact, taking a quasi scale
 * of sqrt(2)/50 * round caliber * srqt(change in speed). The second term is
 * explosive * indirect hit, for any explosive contribution
 */
private _spallPower = (ACE_FRAG_SPALL_CALIBER_COEF * _caliber * sqrt _speedChange + _explosive * _indirectHit) * GVAR(spallIntensity);
TRACE_3("found speed",_speedChange,_caliber,_spallPower);

if (_spallPower < 2) exitWith {
    TRACE_1("lowImpulse",_ammo);
};

private _lastVelocityNorm = vectorNormalized _lastVelocity;
private _deltaStep = _lastVelocityNorm vectorMultiply 0.05;

if (terrainIntersectASL [_lastPosASL vectorAdd _deltaStep, _lastPosASL]) exitWith {
    TRACE_2("terrainIntersect",_lastPosASL,_deltaStep);
};

#ifdef DEBUG_MODE_DRAW
if GVAR(dbgSphere) then {
    [_lastPosASL vectorAdd _lastVelocityNorm, "orange"] call FUNC(dev_sphereDraw);
    [_lastPosASL, "yellow"] call FUNC(dev_sphereDraw);
};
#endif

/*
 * Improve performance of finding otherside of object on shallow angle
 * impacts. 120 degrees due to 90 degree offset with _lastVelocityNorm into object.
 */
private _spallPosASL = _lastPosASL vectorAdd _deltaStep;
if (120 > acos (_lastVelocityNorm vectorDotProduct _surfaceNorm)) then {
    _spallPosASL = _spallPosASL vectorAdd (_deltaStep vectorMultiply 5);
};
private _insideObject = true;
for "_i" from 2 to 21 do
{
    private _nextPos = _spallPosASL vectorAdd _deltaStep;
    if (!lineIntersects [_spallPosASL, _nextPos]) then {
        _spallPosASL = _nextPos vectorAdd (_deltaStep vectorMultiply 2);
        _insideObject = false;
        break
    };
    _spallPosASL = _nextPos;
};

if (_insideObject) exitWith {
    TRACE_3("insideObj",_lastPosASL,_spallPosASL,alive _projectile);
};
// Passed all exitWiths
GVAR(nextSpallAllowTime) = CBA_missionTime + ACE_FRAG_SPALL_HOLDOFF;

#ifdef DEBUG_MODE_DRAW
if GVAR(dbgSphere) then {
    [_spallPosASL, "green"] call FUNC(dev_sphereDraw);
};
#endif

private _spawnSize = switch (true) do
{
    case (_spallPower < 3): {"_spall_tiny"};
    case (_spallPower < 5): {"_spall_small"};
    case (_spallPower < 8): {"_spall_medium"};
    case (_spallPower < 12): {"_spall_large"} ;
    default {"_spall_huge"};
};

private _spallSpawner = createVehicle [
    QUOTE(GLUE(ADDON,_)) + _material + _spawnSize,
    ASLToATL _spallPosASL,
    [],
    0,
    "CAN_COLLIDE"
];
_spallSpawner setVectorDirandUp [_lastVelocityNorm, _vectorUp];
_spallSpawner setVelocityModelSpace [0, _speedChange * ACE_FRAG_SPALL_VELOCITY_INHERIT_COEFF, 0];
_spallSpawner setShotParents _shotParents;

#ifdef DEBUG_MODE_FULL
systemChat ("spd: " + str speed _spallSpawner + ", spawner: " + _fragSpawnType + ", spallPow: " + str _spallPower);
#endif
#ifdef DEBUG_MODE_DRAW
_spallSpawner addEventHandler [
    "SubmunitionCreated",
    {
        params ["", "_subProj"];
        [_subProj] call FUNC(dev_addRound);
    }
];
#endif
