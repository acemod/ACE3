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

{
    [_this select 1] call _x;
    false
} count ((missionNamespace getVariable ["ACE_EventHandler_ScrollWheel", [-1, [], []]]) select 2);

nil
