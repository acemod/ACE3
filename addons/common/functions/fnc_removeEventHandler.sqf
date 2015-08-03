/*
 * Author: Nou
 *
 * Remove an event handler.
 *
 * Argument:
 * 0: Event name (string)
 * 1: Event code (number)
 *
 * Return value:
 * Nothing
 */
#include "script_component.hpp"
private ["_eventNames", "_eventFunctions", "_eventIndex"];

params ["_eventName", "_eventCodeIndex"];

_eventNames = GVAR(events) select 0;
_eventFunctions = [];
_eventIndex = _eventNames find _eventName;

if (_eventIndex != -1) then {
    _eventFunctions = (GVAR(events) select 1) select _eventIndex;
    _eventFunctions set[_eventCodeIndex, nil];
};
