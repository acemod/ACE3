/*
 * Author: Nou
 *
 * Remove all events of a certain event type.
 *
 * Argument:
 * 0: Event name (string)
 *
 * Return value:
 * Nothing
 */
#include "script_component.hpp"
private ["_eventNames", "_eventFunctions", "_eventIndex"];

params ["_eventName"];

_eventNames = GVAR(events) select 0;
_eventFunctions = [];
_eventIndex = _eventNames find _eventName;
if (_eventIndex != -1) then {
    (GVAR(events) select 1) set [_eventIndex, []];
};