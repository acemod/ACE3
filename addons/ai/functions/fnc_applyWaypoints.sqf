#include "script_component.hpp"
/*
 * Author: commy2
 * Set group's waypoints.
 *
 * Arguments:
 *  0: A group <GROUP, OBJECT>
 *  1: Waypoints from ace_ai_fnc_copyWaypoints <ARRAY>
 *
 * Return Value:
 *  Nothing
 *
 * Example:
 *  [group1, _waypoints1] call ace_ai_fnc_applyWaypoints;
 *
 * Public: Yes
 */

params [["_group", grpNull, [grpNull, objNull]], ["_waypointData", [], [[]]]];

if (_group isEqualType objNull) then {
    _group = group _group;
};

// group waypoints
for "_i" from 1 to count waypoints _group do {
    deleteWaypoint [_group, 0];
};

{
    _x params [
        "_type",
        "_description",
        "_name",
        "_position",
        "_completionRadius",
        "_combatMode",
        "_behaviour",
        "_formation",
        "_speed",
        "_statements",
        "_script",
        "_triggers"
    ];

    private _waypoint = _group addWaypoint [[0,0,0], 0];
    _waypoint setWaypointType _type;
    _waypoint setWaypointDescription _description;
    _waypoint setWaypointName _name;
    _waypoint setWaypointPosition [_position, 0];
    _waypoint setWaypointCompletionRadius _completionRadius;
    _waypoint setWaypointCombatMode _combatMode;
    _waypoint setWaypointBehaviour _behaviour;
    _waypoint setWaypointFormation _formation;
    _waypoint setWaypointSpeed _speed;
    _waypoint setWaypointStatements _statements;
    _waypoint setWaypointScript _script;

    {
        _x synchronizeTrigger [_waypoint];
    } forEach _triggers;
} forEach _waypointData;
