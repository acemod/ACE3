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
 * [getPosASL _projectile, velocity _projectile, typeOf _projectile, getShotParents _projectile] call ace_frag_fnc_doFrag;
 *
 * Public: No
 */

TRACE_1("begin doFrag",_this);
params ["_posASL", "_velocity", "_ammo", "_shotParents"];

// Don't let a single object cause all fragmentation events
_shotParents params ["_shotParentVic"];
if (_shotParentVic getVariable [QGVAR(obj_nextFragTime), -1] > CBA_missionTime) exitWith {
    TRACE_1("vehicleTimeExit",_shotParentVic);
};
_shotParentVic setVariable [QGVAR(obj_nextFragTime), CBA_missionTime + ACE_FRAG_HOLDOFF_VEHICLE];

// Check normal round timeout and adjust _max frags
private _timeSinceLastFrag = CBA_missionTime - GVAR(lastFragTime);
if (_timeSinceLastFrag < ACE_FRAG_HOLDOFF || {_posASL isEqualTo [0, 0, 0]} || {_ammo isEqualTo ""}) exitWith {
    TRACE_3("timeExit",_timeSinceLastFrag,CBA_missionTime,GVAR(lastFragTime));
};
private _maxFragCount = round linearConversion [ACE_FRAG_COUNT_MIN_TIME, ACE_FRAG_COUNT_MAX_TIME, _timeSinceLastFrag, ACE_FRAG_COUNT_MIN, ACE_FRAG_COUNT_MAX, true];
TRACE_3("willFrag",_timeSinceLastFrag,CBA_missionTime,_maxFragCount);

private _ammoArr = [_ammo] call FUNC(getFragInfo);
_ammoArr params ["_fragRange", "_fragVel", "_fragTypes", "_modFragCount"];
// For low frag rounds limit the # of frags created
if (_modFragCount < ACE_FRAG_LOW_FRAG_MOD_COUNT) then {
    _maxFragCount = _modFragCount * ACE_FRAG_LOW_FRAG_COEFF;
    GVAR(lastFragTime) = CBA_missionTime - ACE_FRAG_LOW_FRAG_HOLDOFF_REDUCTION;
} else {
    GVAR(lastFragTime) = CBA_missionTime;
};
// Offset for ground clearance
private _heightATL = (ASLToATL _posASL)#2;
if (_heightATL < ACE_FRAG_MIN_GROUND_OFFSET) then {
    _posASL = _posASL vectorAdd [0, 0, ACE_FRAG_MIN_GROUND_OFFSET - (0 min _heightATL)];
};

TRACE_3("fnc_doFragTargeted IF",_fragRange,_timeSinceLastFrag,GVAR(fragSimComplexity));
if (GVAR(fragSimComplexity) != 1 && _fragRange > 3) then {
    _maxFragCount = _maxFragCount - ([_posASL, _fragVel, _fragRange, _maxFragCount, _fragTypes, _modFragCount, _shotParents] call FUNC(doFragTargeted));
};

if (GVAR(fragSimComplexity) > 0) then {
    [_posASL, _velocity, _heightATL, _fragTypes, _maxFragCount, _shotParents] call FUNC(doFragRandom);
};
