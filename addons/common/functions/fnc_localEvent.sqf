/*
 * Author: Nou
 *
 * Execute a local event on this client only.
 *
 * Argument:
 * 0: Event name (string)
 * 1: Event args (any)
 *
 * Return value:
 * Nothing
 */
#include "script_component.hpp"

params ["_eventName", "_eventArgs"];

private["_eventIndex", "_eventNames", "_events"];

_eventNames = GVAR(events) select 0;
_eventIndex = _eventNames find _eventName;
if(_eventIndex != -1) then {
    _events = (GVAR(events) select 1) select _eventIndex;
    #ifdef DEBUG_EVENTS
        diag_log text format[ARR_2("* Local Event: %1",_eventName)];
        diag_log text format[ARR_2("    args=%1",_eventArgs)];
    #endif

    {
        if(!isNil "_x") then {
            _eventArgs call CALLSTACK_NAMED(_x, format[ARR_3("Local Event %1 ID: %2",_eventName,_forEachIndex)]);
            #ifdef DEBUG_EVENTS_CALLSTACK
                diag_log text format[ARR_2("    ID: %1",_forEachIndex)];
            #endif
        };
    } forEach _events;
};
