/*
 * Author: Nou
 *
 * Remove an event handler.
 *
 * Arguments:
 * 0: Event name (string)
 * 1: Event code (number)
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_eventNames", "_eventFunctions", "_eventIndex"];

params ["_eventName", "_eventCodeIndex"];

GVAR(events) params ["_eventNames", "_events"];

_eventFunctions = [];
_eventIndex = _eventNames find _eventName;

if (_eventIndex != -1) then {
    _eventFunctions = _events select _eventIndex;
    _eventFunctions set[_eventCodeIndex, nil];
};
