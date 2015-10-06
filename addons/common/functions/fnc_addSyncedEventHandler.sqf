/*
 * Author: jaynus
 * Register an event handler for an ACE synced event
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Handler <CODE>
 * 2: TTL (optional: 0) <NUMBER, CODE>
 *
 * Return Value:
 * Boolean of success <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_name", "_handler", ["_ttl", 0]];

if (HASH_HASKEY(GVAR(syncedEvents),_name)) exitWith {
    ACE_LOGERROR("Duplicate synced event creation.");
    false
};

private ["_eventId", "_data"];

_eventId = [_name, FUNC(_handleSyncedEvent)] call FUNC(addEventHandler);
_data = [_handler, [], _ttl, _eventId];

HASH_SET(GVAR(syncedEvents),_name,_data);
