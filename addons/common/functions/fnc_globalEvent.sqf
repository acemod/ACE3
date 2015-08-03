/*
 * Author: Nou
 *
 * Execute a global event on all clients, including self.
 *
 * Argument:
 * 0: Event name (string)
 * 1: Event args (any)
 *
 * Return value:
 * Nothing
 */
#include "script_component.hpp"
//IGNORE_PRIVATE_WARNING("_handleNetEvent");

params ["_eventName", "_eventArgs"];

ACEg = [_eventName, _eventArgs];
publicVariable "ACEg";
["ACEg", ACEg] call FUNC(_handleNetEvent);