/*
 * Author: commy2
 *
 * ?
 *
 * Arguments:
 * ?
 *
 * Return value:
 * ?
 *
 * Public : No
 */
#include "script_component.hpp"

params ["_scroll"];

if (GVAR(ScrollWheelFrame) == diag_frameno) exitWith {};
GVAR(ScrollWheelFrame) = diag_frameno;

{
    [_scroll] call _x;
} count ((missionNamespace getVariable ["ACE_EventHandler_ScrollWheel", [-1, [], []]]) select 2);
