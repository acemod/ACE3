#include "script_component.hpp"
/*
 * Author: commy2
 * Copy group's waypoints.
 *
 * Arguments:
 *  0: A group <GROUP, OBJECT>
 *
 * Return Value:
 *  Waypoint data <ARRAY>
 *
 * Example:
 *  private _waypoints1 = group1 call ace_ai_fnc_copyWaypoints;
 *
 * Public: Yes
 */

params [["_group", grpNull, [grpNull, objNull]]];

if (_group isEqualType objNull) then {
    _group = group _group;
};

private _waypointData = waypoints _group apply {[
    waypointType _x,
    waypointDescription _x,
    waypointName _x,
    waypointPosition _x,
    waypointCompletionRadius _x,
    waypointCombatMode _x,
    waypointBehaviour _x,
    waypointFormation _x,
    waypointSpeed _x,
    waypointStatements _x,
    waypointScript _x,
    synchronizedTriggers _x
]};

_waypointData
