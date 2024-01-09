#include "script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger
 * This function handles creating both random and targeted fragments as well
 * as handling some of the performance optimizations.
 *
 * Arguments:
 * 0: Array of argumentse
 * 	0.0: projectile that's fragmenting <OBJECT>
 * 	0.1: ASL position of projectile <ARRAY>
 * 	0.2: velocity of projectile <ARRAY>
 * 1: Whether the projectile is a submunition <BOOL>
 * 
 * Return Value:
 * None
 *
 * Example:
 * [[_proj, getPosASL _proj, velocity _proj]] call ace_frag_fnc_doFrag;
 *
 * Public: No
 */
params ["_args", ["_isSubMunit", false, [false]]];
_args params [
    ["_proj", objNull, [objNull]], 
    ["_posASL", [0,0,0], [[]], [3]], 
    ["_vel", [0,0,0] , [[]], [3]],
	["_ammo", "", [""]],
	["_shotParents", [objNull, objNull], [[]]]
];
TRACE_3("",_proj,_posASL,_vel);

private _shotParentVic = _shotParents#0;
if (_shotParentVic getVariable [QGVAR(nextFragTime), -1] > CBA_missionTime) exitWith {
	TRACE_1("vehicleTimeExit",_shotParentVic);
};
_shotParentVic setVariable [QGVAR(nextFragTime), CBA_missionTime + ACE_FRAG_HOLDOFF_VEHICLE];

private _timeSince = CBA_missionTime - GVAR(lastFragTime);
if (_ammo isEqualTo "" || {_posASL isEqualTo [0,0,0] || _timeSince < ACE_FRAG_HOLDOFF}) exitWith {
	TRACE_3("timeExit",_timeSince,CBA_missionTime,GVAR(lastFragTime));
};
GVAR(lastFragTime) = CBA_missionTime;
private _maxFrags = round (linearConversion [0.1, 1.5, _timeSince, ACE_FRAG_COUNT_MIN, ACE_FRAG_COUNT_MAX, true]);
TRACE_3("",_timeSince,CBA_missionTime,_maxFrags);


private _ammoArr = [_ammo] call FUNC(getFragInfo);
_ammoArr params ["_fragRange", "_fragVel", "_fragTypes", "_modFragCount"];

private _heightAGL = (ASLToAGL _posASL)#2;
if (_heightAGL < 0.25) then {
    _posASL = _posASL vectorAdd [0, 0, 0.25];
};

// make timesince a gvar?
TRACE_4("fnc_doFragTargeted IF", _fragRange, _timeSince, _isSubMunit, GVAR(enSubMunit));
if (_fragRange > 3 && _timeSince > 0.3 && {!_isSubMunit || {GVAR(enSubMunit) == 2}}) then {
    _maxFrags = _maxFrags - ([_posASL, _fragVel, _fragRange, _maxFrags, _fragTypes, _modFragCount, _shotParents] call FUNC(doFragTargeted));
};

// make a gvar?
if (_timeSince > 0.2 && {GVAR(enSubMunit) != 0}) then {
    [_posASL, _vel, _heightAGL, _fragTypes, _maxFrags, _shotParents] call FUNC(doFragRandom);
};

if (GVAR(reflectionsEnabled)) then {
    [_posASL, _shellType] call FUNC(doReflections);
};