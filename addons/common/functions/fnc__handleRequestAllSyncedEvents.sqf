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

[GVAR(syncedEvents), {
    //IGNORE_PRIVATE_WARNING ["_key", "_value"];
    _value params ["", "_eventLog"];

    ["ACEs", [_key, _eventLog], _client] call CBA_fnc_targetEvent;
    false
}] call CBA_fnc_hashEachPair;

true
