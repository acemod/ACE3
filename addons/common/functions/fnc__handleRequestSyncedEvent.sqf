/*
 * Author: jaynus
 *
 *
 * Argument:
 * 
 * Return value:
 * Boolean of success
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

//SEH_s
if(isServer) then {
    // Find the event name, and shovel out the events to the client
    PARAMS_2(_eventName,_client);
    private["_eventEntry", "_eventLog"];
    
    if(!HASH_HASKEY(GVAR(syncedEvents),_eventName)) exitWith {
        diag_log text format["[ACE] Error, request for synced event - key not found."];
        false
    };
    _eventEntry = HASH_GET(GVAR(syncedEvents),_eventName);
    _eventLog = _eventEntry select 1;
    
    ["SEH_s", _client, [_eventName, _eventLog] ] call FUNC(targetEvent);
} else {
    PARAMS_2(_eventName,_eventLog);
    // This is the client handling the response from the server
    // Start running the events
    {
        _eventArgs = _x select 1;
        [_eventName, _eventArgs, (_x select 2)] call FUNC(_handleSyncedEvent);
    } forEach _eventLog;
};

true