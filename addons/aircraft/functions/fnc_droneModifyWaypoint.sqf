#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Modify the current waypoint of a drone
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Group <GROUP>
 * 2: Type <STRING>
 * 3: Value <ANY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [v, group v, "height", 2000] call ace_aircraft_fnc_droneModifyWaypoint
 *
 * Public: No
 */
 
params ["_vehicle", "_group", "_type", "_value"];
TRACE_4("droneModifyWaypoint",_vehicle,_group,_type,_value);

private _index = (currentWaypoint _group) min count waypoints _group;
private _waypoint = [_group, _index];
switch (toLower _type) do {
    case ("height"): {
        private _pos = waypointPosition _waypoint;
        _pos set [2, _value];
        _waypoint setWaypointPosition [_pos, 0];
        _vehicle flyInHeight _value;
    };
    case ("radius"): { _waypoint setWaypointLoiterRadius _value; };
    case ("dir"): { _waypoint setWaypointLoiterType _value; };
};
_group setCurrentWaypoint _waypoint;
