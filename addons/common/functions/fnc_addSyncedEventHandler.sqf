/*
 * Author: jaynus
 *
 * Register an event handler for an ACE synced event
 *
 * Argument:
 * 0: Name (String)
 * 1: Handler (Code)
 * 2: TTL (Number or Code) [Optional]
 *
 * Return value:
 * Boolean of success
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"
//IGNORE_PRIVATE_WARNING("_handleSyncedEvent");

params ["_name", "_handler"];

private["_ttl", "_eventId", "_data"];
if( (count _this) > 2) then {
    _ttl = _this select 2;
} else {
    _ttl = 0;
};

if(HASH_HASKEY(GVAR(syncedEvents),_name)) exitWith {
    diag_log text format["[ACE] Error, duplicate synced event creation."];
    false
};

_eventId = [_name, FUNC(_handleSyncedEvent)] call FUNC(addEventHandler);
_data = [_handler,[],_ttl,_eventId];
HASH_SET(GVAR(syncedEvents),_name,_data);