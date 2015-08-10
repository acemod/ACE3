// by commy2
// execute on server only!
#include "script_component.hpp"

PARAMS_1(_unit);

private ["_group0", "_rallypoint"];

_group0 = group _unit;  // _group-is a reserved veriable and shouldn't be used

_rallypoint = [
    objNull,
    missionNamespace getVariable ["ACE_Rallypoint_West", objNull],
    missionNamespace getVariable ["ACE_Rallypoint_East", objNull],
    missionNamespace getVariable ["ACE_Rallypoint_Independent", objNull]
] select ([west, east, independent] find side _group0) + 1;

// exit if no moveable rallypoint is placed for that side
if (isNull _rallypoint) exitWith {};

// find leader
private "_leaderVarName";
_leaderVarName = _group0 getVariable [QGVAR(leaderVarName), ""];

// exit if group already has a playable slot assigned as rallypoint leader
if (_leaderVarName != "") exitWith {
    // assign JIP unit as rallypoint leader
    if (str _unit == _leaderVarName) then {
        _unit setVariable ["ACE_canMoveRallypoint", true, true];
    };
};

// treat group leader
_unit = leader _group0;

_leaderVarName = vehicleVarName _unit;

if (_leaderVarName == "") then {
    private "_leaderID";
    _leaderID = GETGVAR(NextLeaderID,0);

    _leaderVarName = format [QUOTE(ACE_Rallypoint_Leader_%1), _leaderID];

    _unit setVehicleVarName _leaderVarName;

    GVAR(NextLeaderID) = _leaderID + 1;
};

// prevent group from getting multiple leaders; use this to assign rallypoint moving ability on JIP
_group0 setVariable [QGVAR(leaderVarName), _leaderVarName];

_unit setVariable ["ACE_canMoveRallypoint", true, true];
