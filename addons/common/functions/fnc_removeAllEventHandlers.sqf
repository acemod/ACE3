/*
 * Author: Nou
 * Remove all events of a certain event type.
 *
 * Argument:
 * 0: Event name <STRING>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_eventName"];

GVAR(events) params ["_eventNames", "_events"];

private ["_eventFunctions", "_eventIndex"];

_eventFunctions = [];
_eventIndex = _eventNames find _eventName;

if (_eventIndex != -1) then {
    _events set [_eventIndex, []];
};
