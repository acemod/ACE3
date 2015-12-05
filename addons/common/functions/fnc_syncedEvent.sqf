/*
 * Author: jaynus
 * Call and propegate a synced event
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Arguments <ARRAY>
 * 2: TTL <NUMBER, CODE> [Optional] for this specific event call
 *
 * Return Value:
 * Boolean of success <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name", "_args", ["_ttl", 0]];

if (!HASH_HASKEY(GVAR(syncedEvents),_name)) exitWith {
    ACE_LOGERROR("Synced event key not found.");
    false
};

private "_eventData";
_eventData = [_name, _args, _ttl];

["SEH", _eventData] call FUNC(globalEvent);
