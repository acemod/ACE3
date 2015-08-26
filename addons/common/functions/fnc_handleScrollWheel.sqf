/*
 * Author: commy2
 * Call event handlers for scroll wheel changes.
 *
 * Arguments:
 * 0: Control eventhandler is attached to <CONTROL>
 * 1: Scroll change <NUMBER>
 *
 * Return value:
 * None
 *
 * Public : No
 */
#include "script_component.hpp"

params ["", "_scroll"];

if (GVAR(ScrollWheelFrame) == diag_frameno) exitWith {};
GVAR(ScrollWheelFrame) = diag_frameno;

{
    [_scroll] call _x;
} count ((missionNamespace getVariable ["ACE_EventHandler_ScrollWheel", [-1, [], []]]) select 2);
