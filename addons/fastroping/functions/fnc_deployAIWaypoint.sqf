#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Waypoint function for the fast rope waypoint.
 *
 * Arguments:
 * 0: Group <GROUP>
 * 1: Waypoint position <ARRAY>
 *
 * Return Value:
 * true <BOOL>
 *
 * Example:
 * [_group, [6560, 12390, 0]] call ace_fastroping_fnc_deployAIWaypoint
 *
 * Public: No
 */
params [["_group", grpNull, [grpNull]], ["_position", [0, 0, 0], [[]], 3]];

private _vehicle = vehicle leader _group;
private _commander = effectiveCommander _vehicle;
private _speedMode = speedMode _group;

// - Approach -----------------------------------------------------------------
if (_vehicle distance2D _position > 50) then {
    _group setSpeedMode "LIMITED";
    _vehicle flyInHeight 20;
    _commander doMove _position;
    waitUntil {_vehicle distance2D _position < 50};
    waitUntil {vectorMagnitude (velocity _vehicle) < 3};
    //doStop _commander;
};

// - Deployment ---------------------------------------------------------------
[_vehicle] call FUNC(deployAI);
waitUntil {!((_vehicle getVariable [QGVAR(deployedRopes), []]) isEqualTo [])};
waitUntil {(_vehicle getVariable [QGVAR(deployedRopes), []]) isEqualTo []};
_group setSpeedMode _speedMode;

true
