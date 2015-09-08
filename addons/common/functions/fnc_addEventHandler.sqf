/*
 * Author: Nou
 * Add a event handler.
 *
 * Arguments:
 * 0: Event name <STRING>
 * 1: Event code <CODE>
 *
 * Return Value:
 * Event handler ID number (for use with fnc_removeEventHandler) <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_eventFunctions", "_eventNameCount", "_eventIndex", "_eventFunctionCount"];

params ["_eventName", "_eventCode"];

GVAR(events) params ["_eventNames","_event"];
_eventFunctions = [];
_eventIndex = _eventNames find _eventName;
if (_eventIndex != -1) then {
    _eventFunctions = _event select _eventIndex;
} else {
    _eventNames pushBack _eventName;
    _event pushBack _eventFunctions;
};

_eventFunctions pushBack _eventCode // Return
