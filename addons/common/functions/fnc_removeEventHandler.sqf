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
 * Public: Yes
 */
#include "script_component.hpp"

params ["_eventName", "_eventCodeIndex"];

private _eventFunctions = GVAR(eventsLocation) getVariable _eventName;

if (isNil "_eventFunctions") exitWith {TRACE_1("eventName not found",_eventName);};
if ((_eventCodeIndex < 0) || {(count _eventFunctions) <= _eventCodeIndex}) exitWith {TRACE_2("index out of bounds",_eventName,_eventCodeIndex);};

_eventFunctions set [_eventCodeIndex, nil];
