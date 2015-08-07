/*
 * Author: jaynus
 *
 * Receives either requests for synchronization from clients, or the synchronization data from the server.
 *
 * Arguments [Client] :
 * 0: eventName (String)
 * 1: eventLog (Array)
 *
 * Arguments [Server] :
 * 0: eventName (String)
 * 1: client (Object)
 *
 * Return value:
 * Event is successed (BOOLEAN)
 *
 * Public : No
 */
#include "script_component.hpp"

//SEH_s
if(isServer) then {
    // Find the event name, and shovel out the events to the client
    private["_eventEntry", "_eventLog"];
    params ["_eventName", "_client"];

    if(!HASH_HASKEY(GVAR(syncedEvents),_eventName)) exitWith {
        diag_log text format["[ACE] Error, request for synced event - key not found."];
        false
    };
    _eventEntry = HASH_GET(GVAR(syncedEvents),_eventName);
    _eventLog = _eventEntry select 1;

    ["SEH_s", _client, [_eventName, _eventLog] ] call FUNC(targetEvent);
} else {
    private ["_eventArgs"];
    params ["_eventName", "_eventLog"];
    // This is the client handling the response from the server
    // Start running the events
    {
        _x params ["_eventArgs","_ttl"];
        [_eventName, _eventArgs, _ttl] call FUNC(_handleSyncedEvent);
    } count _eventLog;
    diag_log text format["[ACE] + [%1] synchronized", _eventName];
};

true // Return
