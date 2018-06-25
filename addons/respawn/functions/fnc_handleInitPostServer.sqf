#include "script_component.hpp"
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

params ["_unit"];

private _groupUnit = group _unit; // _group is a reserved veriable and shouldn't be used

private _rallypoint = [
    objNull,
    missionNamespace getVariable ["ACE_Rallypoint_West", objNull],
    missionNamespace getVariable ["ACE_Rallypoint_East", objNull],
    missionNamespace getVariable ["ACE_Rallypoint_Independent", objNull]
] select ([west, east, independent] find side _groupUnit) + 1;

// exit if no moveable rallypoint is placed for that side
if (isNull _rallypoint) exitWith {};

// find leader
private _leaderVarName = _groupUnit getVariable [QGVAR(leaderVarName), ""];

// exit if group already has a playable slot assigned as rallypoint leader
if (_leaderVarName != "") exitWith {
    // assign JIP unit as rallypoint leader
    if (str _unit == _leaderVarName) then {
        if (isNil {_unit getVariable "ACE_canMoveRallypoint"}) then {
            _unit setVariable ["ACE_canMoveRallypoint", true, true];
        };
    };
};

// treat group leader
_unit = leader _groupUnit;

_leaderVarName = vehicleVarName _unit;

if (_leaderVarName == "") then {
    private _leaderID = GETGVAR(NextLeaderID,0);

    _leaderVarName = format [QUOTE(ACE_Rallypoint_Leader_%1), _leaderID];

    _unit setVehicleVarName _leaderVarName;

    GVAR(NextLeaderID) = _leaderID + 1;
};

// prevent group from getting multiple leaders; use this to assign rallypoint moving ability on JIP
_groupUnit setVariable [QGVAR(leaderVarName), _leaderVarName];

if (isNil {_unit getVariable "ACE_canMoveRallypoint"}) then {
    _unit setVariable ["ACE_canMoveRallypoint", true, true];
};
