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
//IGNORE_PRIVATE_WARNING("_handleNetEvent");

PARAMS_2(_eventName,_eventArgs);

    #ifdef DEBUG_EVENTS
        ACE_LOGINFO(format ["* Server Event: %1", _eventName]);
        ACE_LOGINFO(format ["    args=%1", _eventArgs]);
    #endif

ACEg = [_eventName, _eventArgs];
if (!isServer) then {
    publicVariableServer "ACEg";
} else {
    ["ACEg", ACEg] call FUNC(_handleNetEvent);
};
