#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger,
 * This function creates spalling when a projectile hits a object and comes to a stop.
 *
 * Arguments:
 * 0: The projectile that may generate spalling <OBJECT>
 * 1: The object the projectile hit <OBJECT>
 * 2: The position (ASL) of the projectile hit<ARRAY>
 * 3: The velocity of the projectile before it hit the surface <ARRAY>
 * 4: The surface normal of the surface hit <ARRAY>
 * 5: The name of the config name or path to bisurf of the surface hit <STRING>
 * 6: The projectiles ammo config  <STRING>
 * 7: The projectiles shot parent <ARRAY>
 * 8: The "up" vector of the projectile when it hit the object <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [BIS_HITPART_EH_ARGS] call ace_frag_fnc_doSpallHitPart;
 *
 * Public: No
 */
TRACE_1("doSpallHitPart",_this);
if (CBA_missionTime < GVAR(nextSpallAllowTime)) exitWith {
    TRACE_2("timeExit",CBA_missionTime,GVAR(nextSpallAllowTime));
};
params ["_projectile", "_objectHit", "_lastPosASL", "_lastVelocity", "_surfaceNorm", "_surfaceType", "_ammo", "_vectorUp"];

// Find spall speed / fragment info
_ammo call FUNC(getSpallInfo) params ["_caliber", "_explosive", "_indirectHit"];
// Add in v2.18 `getShotInfo`'s `fuseDistanceLeft <= 0` to _explosive
if ((alive _projectile && _explosive < 0.5) ||
    _ammo == "" ||
    _lastPosASL isEqualTo [0,0,0] ||
    {_objectHit isKindOf "CAManBase"}) exitWith {
    TRACE_3("exitEarly",alive _projectile,_lastPosASL,_objectHit);
};

private _material = _surfaceType call FUNC(getMaterialInfo);
if (_material == "ground") exitWith {
    TRACE_1("hitGround",_surfaceType);
};

private _speedChange = vectorMagnitude _lastVelocity;
/*
 * This is all fudge factor since real spalling is too complex for calculation.
 * There are two terms. The first is from round impact, taking a quasi scale
 * of caliber coefficient * round caliber * srqt(change in speed). The second term is
 * explosive * indirect hit, for any explosive contribution
 */
private _spallPower = (ACE_FRAG_SPALL_CALIBER_COEF * _caliber * sqrt _speedChange + _explosive * _indirectHit) * GVAR(spallIntensity);
TRACE_3("found speed",_speedChange,_caliber,_spallPower);

if (_spallPower < ACE_FRAG_SPALL_POWER_MIN) exitWith {
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
private _lastSpallPos = _spallPosASL;
// we need to check 1.05 m in the direction of last velocity incrementing by delta step
// Our initial check is from 0m to 5 cm, so we only need to iterate from 2 to 21 to get
// to the full 1.05m
for "_stepNumber" from 2 to 21 do
{
    _spallPosASL = _lastSpallPos vectorAdd _deltaStep;
    if (!lineIntersects [_lastSpallPos, _spallPosASL]) exitWith {
        _spallPosASL = _lastSpallPos vectorAdd _deltaStep;
    };
    _lastSpallPos = _spallPosASL;
};

if (_spallPosASL isEqualTo _lastSpallPos) exitWith {
    TRACE_2("insideObj",_lastPosASL,_spallPosASL);
};

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

private _spallSpawner = createVehicleLocal [
    QUOTE(GLUE(ADDON,_)) + _material + _spawnSize,
    ASLToAGL _spallPosASL,
    [],
    0,
    "CAN_COLLIDE"
];
_spallSpawner setVectorDirAndUp [_lastVelocityNorm, _vectorUp];
_spallSpawner setVelocityModelSpace [0, _speedChange * ACE_FRAG_SPALL_VELOCITY_INHERIT_COEFF, 0];

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
