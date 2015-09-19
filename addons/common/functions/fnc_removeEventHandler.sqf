/*
 * Author: Nou
 * Remove an event handler.
 *
 * Argument:
 * 0: Event name <STRING>
 * 1: Event code <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_eventName", "_eventCodeIndex"];

GVAR(events) params ["_eventNames", "_events"];

private ["_eventFunctions", "_eventIndex"];

_eventFunctions = [];
_eventIndex = _eventNames find _eventName;

if (_eventIndex != -1) then {
    _eventFunctions = _events select _eventIndex;
    _eventFunctions set [_eventCodeIndex, nil];
};
