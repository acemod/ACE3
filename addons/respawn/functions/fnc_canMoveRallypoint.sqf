#include "script_component.hpp"
/*
 * Author: commy2
 * Checks if a unit can move a rally point.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Side <SIDE>
 *
 * Return Value:
 * Can move <BOOL>
 *
 * Example:
 * [ACE_Player, side ACE_Player] call ace_respawn_fnc_canMoveRallypoint
 *
 * Public: No
 */

params ["_unit", "_side"];

// player has to be a rallypoint mover. group leader by default
if !(_unit getVariable ["ACE_canMoveRallypoint", false]) exitWith {false};

// rallypoint of that side has to exist
!isNull ([
    objNull,
    missionNamespace getVariable ["ACE_Rallypoint_West", objNull],
    missionNamespace getVariable ["ACE_Rallypoint_East", objNull],
    missionNamespace getVariable ["ACE_Rallypoint_Independent", objNull]
] select ([west, east, independent] find _side) + 1) // return
