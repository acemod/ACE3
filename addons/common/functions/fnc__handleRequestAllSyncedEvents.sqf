#include "script_component.hpp"
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
 * Example:
 * [bob] call ace_common_fnc__handleRequestAllSyncedEvents
 *
 * Public: No
 */

params ["_client"];

{
    //IGNORE_PRIVATE_WARNING ["_x", "_y"];
    _y params ["", "_eventlog"];
    ["ACEs", [_x, _eventLog], _client] call CBA_fnc_targetEvent;
    false
} forEach GVAR(syncedEvents);

true
