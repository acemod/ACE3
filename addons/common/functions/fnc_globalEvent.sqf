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
private ["_eventName", "_eventArgs"];
//IGNORE_PRIVATE_WARNING(_handleNetEvent);

_eventName = _this select 0;
_eventArgs = _this select 1;


ACEg = [_eventName, _eventArgs];
publicVariable "ACEg";
["ACEg", ACEg] call FUNC(_handleNetEvent);