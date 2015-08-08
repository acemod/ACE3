/*
 * Author: Nou
 *
 * Execute a event only on the server.
 *
 * Arguments:
 * 0: Event name (string)
 * 1: Event args (any)
 *
 * Return value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_eventName", "_eventArgs"];

#ifdef DEBUG_EVENTS
    diag_log text format[ARR_2("* Server Event: %1",_eventName)];
    diag_log text format[ARR_2("    args=%1",_eventArgs)];
#endif

ACEg = _this;
if (!isServer) then {
    publicVariableServer "ACEg";
} else {
    ["ACEg", ACEg] call FUNC(_handleNetEvent);
};
