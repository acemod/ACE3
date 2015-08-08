/*
 * Author: jaynus
 * Register an event handler for an ACE synced event
 *
 * Argument:
 * 0: Name <STRING>
 * 1: Handler <CODE>
 * 2: TTL (optional: 0) <NUMBER, CODE>
 *
 * Return value:
 * Boolean of success <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

private["_ttl", "_eventId", "_data"];

params ["_name", "_handler",["_ttl",0]];

if(HASH_HASKEY(GVAR(syncedEvents),_name)) exitWith {
    diag_log text format["[ACE] Error, duplicate synced event creation."];
    false
};

_eventId = [_name, FUNC(_handleSyncedEvent)] call FUNC(addEventHandler);
_data = [_handler,[],_ttl,_eventId];
HASH_SET(GVAR(syncedEvents),_name,_data);
