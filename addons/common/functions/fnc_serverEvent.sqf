/*
 * Author: Nou
 *
 * Execute a event only on the server.
 *
 * Argument:
 * 0: Event name (string)
 * 1: Event args (any)
 *
 * Return value:
 * Nothing
 */
#include "script_component.hpp"
private ["_eventName", "_eventArgs"];
//IGNORE_PRIVATE_WARNING(_handleNetEvent);

_eventName = _this select 0;
_eventArgs = _this select 1;

    #ifdef DEBUG_EVENTS
        diag_log text format[ARR_2("* Server Event: %1",_eventName)];
        diag_log text format[ARR_2("    args=%1",_eventArgs)];
    #endif

ACEg = [_eventName, _eventArgs];
if(!isServer) then {
    publicVariableServer "ACEg";
} else {
    ["ACEg", ACEg] call FUNC(_handleNetEvent);
};
