/*
 * Author: Nou
 *
 * Add a event handler.
 *
 * Argument:
 * 0: Event name (string)
 * 1: Event code (code)
 *
 * Return value:
 * Event handler ID number (for use with fnc_removeEventHandler)
 */
#include "script_component.hpp"

private ["_eventNames", "_eventFunctions", "_eventNameCount", "_eventIndex", "_eventFunctionCount"];

params ["_eventName", "_eventCode"];

_eventNames = GVAR(events) select 0;
_eventFunctions = [];
_eventIndex = _eventNames find _eventName;
if (_eventIndex != -1) then {
    _eventFunctions = (GVAR(events) select 1) select _eventIndex;
} else {
    _eventNameCount = count _eventNames;
    _eventNames set[_eventNameCount, _eventName];
    (GVAR(events) select 1) set[_eventNameCount, _eventFunctions];
};

_eventFunctionCount = count _eventFunctions;
_eventFunctions set [_eventFunctionCount, _eventCode];

_eventFunctionCount;
