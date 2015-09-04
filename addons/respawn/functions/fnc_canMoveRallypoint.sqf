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
#include "script_component.hpp"

#define SIDES [west, east, independent]
#define RALLYPOINTS ["ACE_Rallypoint_West", "ACE_Rallypoint_East", "ACE_Rallypoint_Independent"]

private "_index";

params ["_unit", "_side"];

// rallypoint names are defined in CfgVehicles.hpp

if (!(_unit getVariable ["ACE_canMoveRallypoint", false])) exitWith {false};

_index = SIDES find _side;
if (_index < 0) exitWith {false};
if(isNull (missionNamespace getVariable [RALLYPOINT select _index, objNull])) exitWith {false};

true
