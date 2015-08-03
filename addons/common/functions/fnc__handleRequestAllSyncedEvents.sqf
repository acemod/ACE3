/*
 * Author: jaynus
 *
 * Handles a server-side request for synchronization ALL events on JIP to a client.
 *
 * Argument:
 * 0: client (object)
 *
 * Return value:
 * Boolean of success
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"
params ["_client"];

{
    private["_eventName", "_eventEntry", "_eventLog"];
    _eventName = _x;
    _eventEntry = HASH_GET(GVAR(syncedEvents),_eventName);
    _eventLog = _eventEntry select 1;

    ["SEH_s", _client, [_eventName, _eventLog] ] call FUNC(targetEvent);
} forEach (GVAR(syncedEvents) select 0);

true