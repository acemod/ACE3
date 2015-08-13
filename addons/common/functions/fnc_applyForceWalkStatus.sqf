/*
 * Author: Pabst Mirror
 * Applys the forceWalk status of an unit. Called from Extended_InitPost_EventHandlers.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_Player] call FUNC(applyForceWalkStatus)
 *
 * Public: No
*/
#include "script_component.hpp"

private ["_forceWalkNumber"];

params ["_unit"];
_forceWalkNumber = _unit getVariable ["ACE_forceWalkStatusNumber", 0];

_unit forceWalk (_forceWalkNumber > 0);
