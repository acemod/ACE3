/*
 * Author: Nou
 *
 * Add a event handler.
 *
 * Arguments:
 * 0: Event name (string)
 * 1: Event code (code)
 *
 * Return value:
 * Event handler ID number (for use with fnc_removeEventHandler)
 *
 * Public : No
 */
#include "script_component.hpp"

private ["_eventNames", "_eventFunctions", "_eventNameCount", "_eventIndex", "_eventFunctionCount"];

params ["_eventName", "_eventCode"];

GVAR(events) params ["_eventNames","_event"];
_eventNames = _eventNames;
_eventFunctions = [];
_eventIndex = _eventNames find _eventName;
if (_eventIndex != -1) then {
    _eventFunctions = _event select _eventIndex;
} else {
    _eventNameCount = count _eventNames;
    _eventNames set[_eventNameCount, _eventName];
    _event set[_eventNameCount, _eventFunctions];
};

_eventFunctions pushBack _eventCode // Return
