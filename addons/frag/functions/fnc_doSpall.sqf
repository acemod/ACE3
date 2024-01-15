#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger,
 * This function creates spalling if the hit slowed the speed down enough.
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
TRACE_1("doSpall",_this);
params [
    "_projectile",
    ["_hitObj", objNull],
    ["_lPosASL", [0, 0, 0]],
    ["_lVel", [0, 0, 0]],
    ["_sNorm", [0, 0, 0]],
    ["_surfaceType", ""],
    ["_ammo", "", [""]],
    ["_shotParents", [objNull, objNull], [[]]],
    ["_vUp", [0,0,1]]
];

if (CBA_missionTime - GVAR(lastSpallTime) < ACE_FRAG_SPALL_HOLDOFF ||
    _lPosASL isEqualTo [0,0,0] ||
    {isNull _hitObj || {_hitObj isKindOf "man" ||
    {_ammo isEqualTo ""}}}) exitWith {
    TRACE_4("time/invldHit",CBA_missionTime,GVAR(lastSpallTime),_hitObj,_lPosASL);
};

private _material = [_surfaceType] call FUNC(getMaterialInfo);
if (_material isEqualTo "ground") then {
#ifdef DEBUG_MODE_FULL
    systemChat "ground spall";
#endif
};

// Find spall speed / fragment info
[_ammo] call FUNC(getSpallInfo) params ["_caliber", "_explosive", "_indirectHit"];
private _vel = if (alive _projectile) then {
    _explosive = 0; // didn't explode
    velocity _projectile
} else {
    [0, 0, 0];
};

private _dV = vectorMagnitude _lVel - vectorMagnitude _vel;
/*
 * This is all fudge factor since real spalling is too complex for calculation.
 * There are two terms. The first is from round impact, taking a quasi scale
 * of sqrt(2)/50 * round caliber * srqt(change in speed). The second term is
 * explosive * indirect hit, for any explosive contribution
 */
private _spallPower =  (ACE_FRAG_ROUND_COEF * _caliber * sqrt _dV  + _explosive * _indirectHit) * GVAR(spallIntensity);
TRACE_3("found speed",_dV,_caliber,_spallPower);


if (_spallPower < 2) exitWith {
    TRACE_1("lowImpulse",_ammo);
};


private _lVelUnit = vectorNormalized _lVel;
private _unitStep = _lVelUnit vectorMultiply 0.05;

if (terrainIntersectASL [_lPosASL vectorAdd _unitStep, _lPosASL]) exitWith {
    TRACE_3("terrainIntersect",_lPosASL,_unitStep,_lPosASL);
};

#ifdef DEBUG_MODE_DRAW
if GVAR(dbgSphere) then {
    [_lPosASL vectorAdd _lVelUnit, "orange"] call FUNC(dev_sphereDraw);
    [_lPosASL, "yellow"] call FUNC(dev_sphereDraw);
};
#endif

/*
 * Improve performance of finding otherside of object on shallow angle
 * impacts. 120 degrees due to 90 degree offset with _lVelUnit into object.
 */
private _spallPos = _lPosASL vectorAdd _unitStep;
if (120 > acos ( _lVelUnit vectorDotProduct _sNorm)) then {
    _spallPos = _spallPos vectorAdd (_unitStep vectorMultiply 5);
};
private _insideObject = true;
for "_i" from 2 to 21 do
{
    private _nPos = _spallPos vectorAdd _unitStep;
    if (!lineIntersects [_spallPos, _nPos]) then {
        _spallPos = _nPos vectorAdd (_unitStep vectorMultiply 2);
        _insideObject = false;
        break
    };
    _spallPos = _nPos;
};

if (_insideObject) exitWith {
    TRACE_3("insideObj",_lPosASL,_spallPos,alive _projectile);
};
// Passed all exitWiths
GVAR(lastSpallTime) = CBA_missionTime;

#ifdef DEBUG_MODE_DRAW
if GVAR(dbgSphere) then {
    [_spallPos, "green"] call FUNC(dev_sphereDraw);
};
#endif

private _spawnSize = switch (true) do
{
    case (_spallPower < 3): { "_spall_tiny" };
    case (_spallPower < 5): { "_spall_small" };
    case (_spallPower < 8): { "_spall_medium" };
    case (_spallPower < 12): { "_spall_large" };
    default { "_spall_huge" };
};

private _spallSpawner = createVehicle [
    "ace_frag_" + _material + _spawnSize,
    ASLToATL _spallPos,
    [],
    0,
    "CAN_COLLIDE"
];
_spallSpawner setVectorDirandUp [_lVelUnit, _vUp];
_spallSpawner setVelocity (_lVelUnit vectorMultiply (_dV/2));
_spallSpawner setShotParents _shotParents;

#ifdef DEBUG_MODE_FULL
systemChat ("bSpd: " + str speed _spallSpawner + ", frag: " + _fragSpawnType + ", dm: " + str _spallPower);
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