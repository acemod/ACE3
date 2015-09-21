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
 * [ACE_Player] call ace_common_fnc_applyForceWalkStatus
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

private "_forceWalkNumber";
_forceWalkNumber = _unit getVariable ["ACE_forceWalkStatusNumber", 0];

_unit forceWalk (_forceWalkNumber > 0);
