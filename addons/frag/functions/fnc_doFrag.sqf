#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger
 * This function handles creating both random and targeted fragments as well
 * as handling some of the performance optimizations.
 *
 * Arguments:
 * 0: projectile that's fragmenting <OBJECT>
 * 1: ASL position of projectile <ARRAY>
 * 2: velocity of projectile <ARRAY>
 * 3: projectile cfgAmmo classname <STRING>
 * 4: getShotParents of projectile at EH <ARRAY>
 * 
 * Return Value:
 * None
 *
 * Example:
 * [[_proj, getPosASL _proj, velocity _proj]] call ace_frag_fnc_doFrag;
 *
 * Public: No
 */
TRACE_1("",_this);
params [
    ["_proj", objNull, [objNull]], 
    ["_posASL", [0,0,0], [[]], [3]], 
    ["_vel", [0,0,0] , [[]], [3]],
    ["_ammo", "", [""]],
    ["_shotParents", [objNull, objNull], [[]]]
];

private _shotParentVic = _shotParents#0;
if (_shotParentVic getVariable [QGVAR(nextFragTime), -1] > CBA_missionTime) exitWith {
    TRACE_1("vehicleTimeExit",_shotParentVic);
};
_shotParentVic setVariable [QGVAR(nextFragTime), CBA_missionTime + ACE_FRAG_HOLDOFF_VEHICLE];

private _timeSince = CBA_missionTime - GVAR(lastFragTime);
if (_ammo isEqualTo "" || {_posASL isEqualTo [0,0,0] || _timeSince < ACE_FRAG_HOLDOFF}) exitWith {
    TRACE_3("timeExit",_timeSince,CBA_missionTime,GVAR(lastFragTime));
};
private _maxFrags = round linearConversion [0.1, 1.5, _timeSince, ACE_FRAG_COUNT_MIN, ACE_FRAG_COUNT_MAX, true];
TRACE_3("",_timeSince,CBA_missionTime,_maxFrags);


private _ammoArr = [_ammo] call FUNC(getFragInfo);
_ammoArr params ["_fragRange", "_fragVel", "_fragTypes", "_modFragCount"];

if (_modFragCount < 10) then {
    _maxFrags = _modFragCount*4;
    GVAR(lastFragTime) = CBA_missionTime - 0.1;
} else {
    GVAR(lastFragTime) = CBA_missionTime;
};

private _heightAGL = (ASLToAGL _posASL)#2;
if (_heightAGL < 0.25) then {
    _posASL = _posASL vectorAdd [0, 0, 0.25];
};

TRACE_3("fnc_doFragTargeted IF", _fragRange, _timeSince, GVAR(fragSimComplexity));
if (_fragRange > 3 && _timeSince > ACE_FRAG_HOLDOFF*1.5 && GVAR(fragSimComplexity) != 1) then {
    _maxFrags = _maxFrags - ([_posASL, _fragVel, _fragRange, _maxFrags, _fragTypes, _modFragCount, _shotParents] call FUNC(doFragTargeted));
};

if (_timeSince > 0.2 && {GVAR(fragSimComplexity) > 0}) then {
    [_posASL, _vel, _heightAGL, _fragTypes, _maxFrags, _shotParents] call FUNC(doFragRandom);
};

if (GVAR(reflectionsEnabled)) then {
    [_posASL, _shellType] call FUNC(doReflections);
};