/*
 * Author: jaynus
 *
 * Call and propegate a synced event
 *
 * Argument:
 * 0: Name (String)
 * 1: Arguments (Array)
 * 2: TTL (Number or Code) [Optional] for this specific event call
 *
 * Return value:
 * Boolean of success
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_name", "_args", ["_ttl", 0]];

private["_eventData"];

if(!HASH_HASKEY(GVAR(syncedEvents),_name)) exitWith {
    diag_log text format["[ACE] Error, synced event key not found."];
    false
};

_eventData = [_name, _args,_ttl];
["SEH", _eventData] call FUNC(globalEvent);
