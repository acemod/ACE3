/*
 * Author: Nou
 *
 * Execute a event only on specific clients.
 *
 * Argument:
 * 0: Event name (string)
 * 1: Event targets (object or array of objects)
 * 2: Event args (any)
 *
 * Note: If local executor is in list of targets, event will execute with
 * network delay, and not immediatly.
 *
 * Return value:
 * Nothing
 */
#include "script_component.hpp"
private ["_eventName", "_eventArgs", "_eventTargets"];

_eventName = _this select 0;
_eventTargets = _this select 1;
_eventArgs = _this select 2;

ACEc = [_eventName, _eventTargets, _eventArgs];
if(!isServer) then {
    publicVariableServer "ACEc";
} else {
    ["ACEc", ACEc] call FUNC(_handleNetEvent);
};