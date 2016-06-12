/*
 * Author: jaynus
 * Receives either requests for synchronization from clients, or the synchronization data from the server.
 *
 * Arguments [Client] :
 * 0: eventName <STRING>
 * 1: eventLog <ARRAY>
 *
 * Arguments [Server] :
 * 0: eventName <STRING>
 * 1: client <OBJECT>
 *
 * Return Value:
 * Event is successed <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

//SEH_s
if (isServer) then {
    // Find the event name, and shovel out the events to the client
    params ["_eventName", "_client"];

    if (!HASH_HASKEY(GVAR(syncedEvents),_eventName)) exitWith {
        ACE_LOGERROR_1("Request for synced event - key [%1] not found.", _eventName);
        false
    };

    private _eventEntry = HASH_GET(GVAR(syncedEvents),_eventName);
    _eventEntry params ["", "_eventLog"];

    ["ACEs", [_eventName, _eventLog], _client] call CBA_fnc_targetEvent;
} else {
    params ["_eventName", "_eventLog"];

    // This is the client handling the response from the server
    // Start running the events
    {
        _x params ["", "_eventArgs","_ttl"];
        [_eventName, _eventArgs, _ttl] call FUNC(_handleSyncedEvent);
        false
    } count _eventLog;

    ACE_LOGINFO_1("[%1] synchronized",_eventName);
};

true
