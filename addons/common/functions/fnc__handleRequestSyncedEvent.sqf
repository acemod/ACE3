/*
 * Author: jaynus
 * Receives either requests for synchronization from clients, or the synchronization data from the server.
 *
 * Arguments [Client]:
 * 0: eventName <STRING>
 * 1: eventLog <ARRAY>
 *
 * Arguments [Server]:
 * 0: eventName <STRING>
 * 1: client <OBJECT>
 *
 * Return Value:
 * Event is successed <BOOL>
 *
 * Example:
 * ["name", [LOG]] call ace_common_fnc__handleRequestSyncedEvent //Client
 * ["name", bob] call ace_common_fnc__handleRequestSyncedEvent//Server
 *
 * Public: No
 */
#include "script_component.hpp"

//SEH_s
if (isServer) then {
    // Find the event name, and shovel out the events to the client
    params ["_eventName", "_client"];

    if !([GVAR(syncedEvents), _eventName] call CBA_fnc_hashHasKey) exitWith {
        ERROR_1("Request for synced event - key [%1] not found.", _eventName);
        false
    };

    private _eventEntry = [GVAR(syncedEvents), _eventName] call CBA_fnc_hashGet;
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

    INFO_1("[%1] synchronized",_eventName);
};

true
