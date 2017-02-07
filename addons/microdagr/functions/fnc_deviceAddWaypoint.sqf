/*
 * Author: PabstMirror
 * Adds a waypoint to the "device"
 * Device saving not implemented yet, just save to player object
 *
 * Arguments:
 * 0: Waypoint name <STRING>
 * 1: Waypoint Position ASL <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Hill 55", [41,324, 12]] call ace_microdagr_fnc_deviceAddWaypoint
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_waypointName","_waypointPosASL"];

private _waypoints = ACE_player getVariable [QGVAR(waypoints), []];
_waypoints pushBack [_waypointName, _waypointPosASL];
ACE_player setVariable [QGVAR(waypoints), _waypoints];
