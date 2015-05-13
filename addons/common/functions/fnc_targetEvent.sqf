/*
 * Author: Nou
 *
 * Execute a event only on specific clients.
 *
 * Argument:
 * 0: Event name (string)
 * 1: Event targets (object or array of objects)
 * 2: Event args (any)
 *
 * Note: If local executor is in list of targets, event will execute with
 * network delay, and not immediatly.
 *
 * Return value:
 * Nothing
 */
#include "script_component.hpp"

PARAMS_3(_eventName,_eventTargets,_eventArgs);

#ifdef DEBUG_EVENTS
    diag_log text format[ARR_3("* Target Event: %1 - %2",_eventName,_eventTargets)];
    diag_log text format[ARR_2("    args=%1",_eventArgs)];
#endif

ACEc = [_eventName, _eventTargets, _eventArgs];
if(!isServer) then {
    publicVariableServer "ACEc";
} else {
    ["ACEc", ACEc] call FUNC(_handleNetEvent);
};