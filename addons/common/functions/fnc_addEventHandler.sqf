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

private _eventFunctions = GVAR(eventsLocation) getVariable _eventName;

if (isNil "_eventFunctions") then {
    _eventFunctions = [];
    GVAR(eventsLocation) setVariable [_eventName, _eventFunctions];
};

_eventFunctions pushBack _eventCode // Return event function count
