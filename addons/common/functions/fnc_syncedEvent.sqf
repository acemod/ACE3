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

PARAMS_2(_name,_args);

private["_ttl", "_eventData"];

if( (count _this) > 2) then {
    _ttl = _this select 2;
} else {
    _ttl = 0;
};

if(!HASH_HASKEY(GVAR(syncedEvents),_name)) exitWith {
    ACE_LOGERROR("Synced event key not found.");
    false
};

_eventData = [_name, _args,_ttl];
["SEH", _eventData] call FUNC(globalEvent);
