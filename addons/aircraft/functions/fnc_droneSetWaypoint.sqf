#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Set new waypoint of a drone
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Group <GROUP>
 * 2: Pos 2D <ARRAY>
 * 3: Type <STRING>
 * 4: Target to follow <OBJECT> (default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [v, group v, [2000,5000], "LOITER"] call ace_aircraft_fnc_droneSetWaypoint
 *
 * Public: No
 */

params ["_vehicle", "_group", "_pos", "_type", ["_target", objNull]];
TRACE_4("droneSetWaypoint",_vehicle,_group,_pos,_type);

private _index = (currentWaypoint _group) min count waypoints _group;
private _waypoint = [_group, _index];
// Try to save attributes from existing waypoint
private _currentHeight = round ((waypointPosition _waypoint) select 2);
private _currentLoiterRadius = waypointLoiterRadius _waypoint;
private _currentLoiterType = waypointLoiterType _waypoint;

// Set pos to ATL
_pos set [
    2,
    [0, _currentHeight] select (_currentHeight >= 50)
];

_waypoint = _group addWaypoint [_pos, 0];
// The Vanilla "FOLLOW"-type waypoint is not used directly, due to 2 main issues (as of v2.16):
// - It does not work at all for UGVs, which is a known issue https://feedback.bistudio.com/T126283;
// - No clear scripting way was found to mimic the UAV Terminal's "Follow Distance" functionality;
// Instead, the solution for both UAV and UGV following consists of a CBA PFH that moves a "HOLD"-type Waypoint every 3 seconds.
// Either on the target itself, or on the Drone's current position if the target is within the desired follow distance.
if (_type == "FOLLOW" && {["CAManBase", "LandVehicle", "Ship"] findIf {_target isKindOf _x} != -1}) then {
    _waypoint setWaypointType "HOLD";
    [{
        params ["_args", "_handle"];
        _args params ["_vehicle", "_group", "_waypoint", "_target"];

        if ( // Abort PFH if a new waypoint is created via UAV Terminal or ACE Interaction
            _waypoint select 1 != currentWaypoint _group ||
            {!alive _vehicle} || {isNull _target}
        ) exitWith {
            deleteWaypoint _waypoint;
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        private _followDistance = _vehicle getVariable [QGVAR(wpFollowDistance), 0];
        if ((_vehicle distance2D _target) < _followDistance) then {
            _waypoint setWaypointPosition [getPosASL _vehicle, -1];
        } else {
            _waypoint setWaypointPosition [getPosASL _target, -1];
        };
    }, 3, [_vehicle, _group, _waypoint, _target]] call CBA_fnc_addPerFrameHandler;
} else {
    _waypoint setWaypointType _type;
};

TRACE_3("",_currentHeight,_currentLoiterRadius,_currentLoiterType);
if (_currentHeight > 1) then { _vehicle flyInHeight _currentHeight; };
if (_currentLoiterRadius > 1) then { _waypoint setWaypointLoiterRadius _currentLoiterRadius; };
if (_currentLoiterType != "") then { _waypoint setWaypointLoiterType _currentLoiterType; };

_group setCurrentWaypoint _waypoint;
