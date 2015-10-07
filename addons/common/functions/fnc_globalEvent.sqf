/*
 * Author: Nou
 * Execute a global event on all clients, including self.
 *
 * Arguments:
 * 0: Event name <STRING>
 * 1: Event args <ANY>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_eventName", "_eventArgs"];

ACEg = [_eventName, _eventArgs];
publicVariable "ACEg";

["ACEg", ACEg] call FUNC(_handleNetEvent);
