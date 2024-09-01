#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger
 * This function runs on every client and determines if a spall event happened.
 * It is intended to be called a frame after the projectile has triggered a hit event,
 * where information such as the object hit, the projectiles velocity and position on impact
 * should be kept and passed to this function.If a spall event should happen, this function
 * calculates the spalling parameters and then calls a server event to create the desired spall effect.
 *
 * Arguments:
 * 0: The projectile that may be creating spall <OBJECT>
 * 1: The object the projectile hit <OBJECT>
 * 2: The 3D position (ASL) of the projectile when it hit the object <ARRAY>
 * 3: The velocity of the projectile when it hit the object <ARRAY>
 * 4: The normal of the surface of the object hit <ARRAY>
 * 5: The class name of the surface, or the bisurf path of the surface hit <STRING>
 * 6: The class name of the projectile that may be spalling <STRING>
 * 7: The spalling projectile's shot parents <ARRAY>
 * 8: The "up" vector of the projectile when it hit the object <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_projectile, _hitObject, _lastPosASLProjectile, _lastVelocityProjectile, _surfaceNorm, "a3\data_f\penetration\armour_plate.bisurf", "Sh_125mm_APFSDS", [0, 0, 1]] call ace_frag_fnc_doSpallLocal
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

private _material = _surfaceType call FUNC(getMaterialInfo);
if (_material == "ground") exitWith {
    TRACE_1("ground",_surfaceType);
};

// Find spall speed / fragment info
_ammo call FUNC(getSpallInfo) params ["_caliber", "_explosive", "_indirectHit"];
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

private _spawnSize = switch (true) do {
    case (_spallPower < ACE_FRAG_SPALL_POWER_TINY_MAX): {"_spall_tiny"};
    case (_spallPower < ACE_FRAG_SPALL_POWER_SMALL_MAX): {"_spall_small"};
    case (_spallPower < ACE_FRAG_SPALL_POWER_MEDIUM_MAX): {"_spall_medium"};
    case (_spallPower < ACE_FRAG_SPALL_POWER_LARGE_MAX): {"_spall_large"};
    default {"_spall_huge"};
};

#ifdef DEBUG_MODE_FULL
systemChat ("spd: " + str (_speedChange * ACE_FRAG_SPALL_VELOCITY_INHERIT_COEFF) + ", spallPow: " + str _spallPower);
#endif

TRACE_5("Calling event:",QUOTE(GLUE(ADDON,_)) + _material + _spawnSize,_lastVelocityNorm,_vectorUp,_speedChange,_shotParents);
[
    QGVAR(spallEvent),
    [QUOTE(GLUE(ADDON,_)) + _material + _spawnSize, _lastVelocityNorm, _vectorUp, _speedChange, _shotParents]
] call CBA_fnc_serverEvent;
