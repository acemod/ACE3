/*
 * Author: commy2
 * Handles MouseZChanged event.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public : No
 */
#include "script_component.hpp"

// prevents a bug that causes the MouseZChanged to trigger N-times, where N is the number of times you consecutively pressed "Restart" instead of "Preview" in the editor
if (GVAR(ScrollWheelFrame) == diag_frameno) exitWith {};

GVAR(ScrollWheelFrame) = diag_frameno;

{
    [_this select 1] call _x;
    false
} count ((missionNamespace getVariable ["ACE_EventHandler_ScrollWheel", [-1, [], []]]) select 2);

nil
