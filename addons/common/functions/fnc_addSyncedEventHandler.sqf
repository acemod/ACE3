/*
 * Author: jaynus
 *
 * Register an event handler for an ACE synced event
 *
 * Arguments:
 * 0: Name (String)
 * 1: Handler (Code)
 * 2: TTL (Number or Code) [Optional]
 *
 * Return value:
 * Boolean of success
 *
 * Public : No
 */
//#define DEBUG_MODE_FULL
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
