/*
 * Author: Nou
 *
 * Execute a event only on specific clients.
 *
 * Arguments:
 * 0: Event name (STRING)
 * 1: Event targets <OBJECT, ARRAY<OBJECT>>
 * 2: Event args <ANY>
 *
 * Note: If local executor is in list of targets, event will execute with
 * network delay, and not immediatly.
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_eventName", "_eventTargets", "_eventArgs"];

#ifdef DEBUG_EVENTS
    diag_log text format[ARR_3("* Target Event: %1 - %2",_eventName,_eventTargets)];
    diag_log text format[ARR_2("    args=%1",_eventArgs)];
#endif

ACEc = _this;
if(!isServer) then {
    publicVariableServer "ACEc";
} else {
    ["ACEc", ACEc] call FUNC(_handleNetEvent);
};
