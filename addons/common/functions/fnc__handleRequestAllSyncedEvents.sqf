/*
 * Author: jaynus
 * Handles a server-side request for synchronization ALL events on JIP to a client.
 *
 * Arguments:
 * 0: client <OBJECT>
 *
 * Return Value:
 * Event is successed <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_client"];

{
    private _eventEntry = HASH_GET(GVAR(syncedEvents),_x);
    _eventEntry params ["", "_eventLog"];

    ["SEH_s", _client, [_x, _eventLog]] call FUNC(targetEvent);
    false
} count (GVAR(syncedEvents) select 0);

true
