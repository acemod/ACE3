/*
 * Author: Nou
 * Add an event handler.
 *
 * Arguments:
 * 0: Event name <STRING>
 * 1: Event code <CODE>
 *
 * Return Value:
 * Event handler ID number (for use with fnc_removeEventHandler) <NUMBER>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_eventName", "_eventCode"];

private ["_eventNames", "_eventFunctions", "_eventIndex"];

_eventNames = GVAR(events) select 0;
_eventFunctions = [];
_eventIndex = _eventNames find _eventName;

if (_eventIndex != -1) then {
    _eventFunctions = (GVAR(events) select 1) select _eventIndex;
} else {
    private "_eventNameCount";
    _eventNameCount = count _eventNames;

    _eventNames set [_eventNameCount, _eventName];
    (GVAR(events) select 1) set [_eventNameCount, _eventFunctions];
};

_eventFunctions pushBack _eventCode // Return event function count
