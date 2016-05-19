/*
 * Author: Nou
 * Execute a event only on the server.
 *
 * Argument:
 * 0: Event name <STRING>
 * 1: Event args <ANY>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_eventName", "_eventArgs"];

#ifdef DEBUG_EVENTS
    ACE_LOGINFO_1("* Server Event: %1",_eventName);
    ACE_LOGINFO_1("    args=%1",_eventArgs);
#endif

ACEg = [_eventName, _eventArgs];

if (!isServer) then {
    publicVariableServer "ACEg";
} else {
    ["ACEg", ACEg] call FUNC(_handleNetEvent);
};
