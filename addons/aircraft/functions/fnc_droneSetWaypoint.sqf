#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Set new waypoint of a drone
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Group <GROUP>
 * 2: Pos 2D <ARRAY>
 * 3: Type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [v, group v, [2000,5000], "LOITER"] call ace_aircraft_fnc_droneSetWaypoint
 *
 * Public: No
 */

params ["_vehicle", "_group", "_pos", "_type"];
TRACE_4("droneSetWaypoint",_vehicle,_group,_pos,_type);

private _index = (currentWaypoint _group) min count waypoints _group;
private _waypoint = [_group, _index];
// Try to save attributes from existing waypoint
private _currentHeight = round ((waypointPosition _waypoint) select 2);
private _currentLoiterRadius = waypointLoiterRadius _waypoint;
private _currentLoiterType = waypointLoiterType _waypoint;

// Set pos to ATL
_pos set [2, if (_currentHeight >= 50) then { _currentHeight } else { 0 }];

// [_group] call CBA_fnc_clearWaypoints;
_waypoint = _group addWaypoint [_pos, 0];
_waypoint setWaypointType _type;

TRACE_3("",_currentHeight,_currentLoiterRadius,_currentLoiterType);
if (_currentHeight > 1) then { _vehicle flyInHeight _currentHeight; };
if (_currentLoiterRadius > 1) then { _waypoint setWaypointLoiterRadius _currentLoiterRadius; };
if (_currentLoiterType != "") then { _waypoint setWaypointLoiterType _currentLoiterType; };

_group setCurrentWaypoint _waypoint;
