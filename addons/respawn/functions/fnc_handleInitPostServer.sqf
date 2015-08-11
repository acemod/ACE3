/*
 * Author: commy2
 * Handle XEH Init Post on Server.
 * Execution on server only.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_Player] call ace_respawn_fnc_handleInitPostServer
 *
 * Public: No
 */
#include "script_component.hpp"

#define SIDES [west, east, independent]
#define RALLYPOINTS ["ACE_Rallypoint_West", "ACE_Rallypoint_East", "ACE_Rallypoint_Independent"]

private ["_unitGroup", "_rallyPoint", "_leaderVarName"];

params ["_unit"];

_unitGroup = group _unit;

_rallyPointIndex = SIDES find side _unitGroup;

// If no applicable side is found, exit early
if (_rallyPointIndex < 0) exitWith {};

_rallyPoint = missionNamespace getVariable [RALLYPOINTS select _rallyPointIndex, objNull];

// exit if no moveable rallypoint is placed for that side
if (isNull _rallyPoint) exitWith {};

// find leader
_leaderVarName = _unitGroup getVariable [QGVAR(leaderVarName), ""];

// exit if group already has a playable slot assigned as rallypoint leader
if (_leaderVarName != "") exitWith {
    // assign JIP unit as rallypoint leader
    if (str _unit == _leaderVarName) then {
        _unit setVariable ["ACE_canMoveRallypoint", true, true];
    };
};

// treat group leader
_unit = leader _unitGroup;

_leaderVarName = vehicleVarName _unit;

if (_leaderVarName == "") then {
    private "_leaderID";
    _leaderID = GETGVAR(NextLeaderID,0);

    _leaderVarName = format [QUOTE(ACE_Rallypoint_Leader_%1), _leaderID];

    _unit setVehicleVarName _leaderVarName;

    GVAR(NextLeaderID) = _leaderID + 1;
};

// prevent group from getting multiple leaders; use this to assign rallypoint moving ability on JIP
_unitGroup setVariable [QGVAR(leaderVarName), _leaderVarName];

_unit setVariable ["ACE_canMoveRallypoint", true, true];
