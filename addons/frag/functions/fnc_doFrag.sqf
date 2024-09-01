#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger
 * This function handles creating both random and targeted fragments as well as handling some of the performance optimizations.
 *
 * Arguments:
 * 0: Position (posASL) of projectile <ARRAY>
 * 1: Velocity of projectile <ARRAY>
 * 2: Projectile CfgAmmo classname <STRING>
 * 3: getShotParents of projectile at EH <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [getPosASL _projectile, velocity _projectile, typeOf _projectile, getShotParents _projectile] call ace_frag_fnc_doFrag
 *
 * Public: No
 */

#define ACE_FRAG_MIN_FRAG_BUDGET_FOR_RANDOM 3
#define ACE_FRAG_NEGATIVE_AGL_OFFSET 0.1

params ["_posASL", "_projectileVelocity", "_ammo", "_shotParents"];
TRACE_4("doFrag",_posASL,_projectileVelocity,_ammo,_shotParents);

// Don't let a single object cause all fragmentation events
_shotParents params ["_shotParentVehicle"];
if (_shotParentVehicle getVariable [QGVAR(obj_nextFragTime), -1] > CBA_missionTime) exitWith {
    TRACE_1("vehicleTimeExit",_shotParentVehicle);
};

// Check normal round timeout and adjust _max frags
private _timeSinceLastFrag = CBA_missionTime - GVAR(lastFragTime);
if (_timeSinceLastFrag < ACE_FRAG_HOLDOFF || {_posASL isEqualTo [0, 0, 0]} || {_ammo isEqualTo ""}) exitWith {
    TRACE_3("timeExit",_timeSinceLastFrag,CBA_missionTime,GVAR(lastFragTime));
};
TRACE_3("willFrag",_timeSinceLastFrag,CBA_missionTime,_maxFragCount);
_shotParentVehicle setVariable [QGVAR(obj_nextFragTime), CBA_missionTime + ACE_FRAG_HOLDOFF_VEHICLE];
private _maxFragCount = round linearConversion [ACE_FRAG_COUNT_MIN_TIME, ACE_FRAG_COUNT_MAX_TIME, _timeSinceLastFrag, ACE_FRAG_COUNT_MIN, ACE_FRAG_COUNT_MAX, true];

_ammo call FUNC(getFragInfo) params ["_fragRange", "_fragVelocity", "_fragTypes", "_modFragCount"];
// For low frag rounds limit the # of frags created
if (_modFragCount < ACE_FRAG_LOW_FRAG_MOD_COUNT) then {
    _maxFragCount = _modFragCount * ACE_FRAG_LOW_FRAG_COEFF;
    GVAR(lastFragTime) = CBA_missionTime - ACE_FRAG_LOW_FRAG_HOLDOFF_REDUCTION;
} else {
    GVAR(lastFragTime) = CBA_missionTime;
};

// Double check if round is below, or too close to terrain for
private _posAGL = ASLToAGL _posASL;
if (_posAGL#2 < ACE_FRAG_NEGATIVE_AGL_OFFSET) then {
    TRACE_1("below 0 AGL",_posAGL);
    _posAGL set [2, ACE_FRAG_NEGATIVE_AGL_OFFSET];
};

TRACE_3("doFrag choices",_maxFragCount,_fragRange,GVAR(fragSimComplexity));
if (GVAR(fragSimComplexity) != 1 && _fragRange > 3) then {
    _maxFragCount = _maxFragCount - ([_posAGL, _fragVelocity, _fragRange, _maxFragCount, _fragTypes, _modFragCount, _shotParents] call FUNC(doFragTargeted));
};

if (GVAR(fragSimComplexity) > 0 && _maxFragCount >= ACE_FRAG_MIN_FRAG_BUDGET_FOR_RANDOM) then {
    [_posAGL, _fragVelocity, _projectileVelocity, _fragTypes, _maxFragCount, _shotParents] call FUNC(doFragRandom);
};
