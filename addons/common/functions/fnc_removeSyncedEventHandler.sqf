/*
 * Author: jaynus
 *
 * Remove a synced event handler
 *
 * Argument:
 * 0: Name (String)
 *
 * Return value:
 * Boolean of success
 */
#include "script_component.hpp"

PARAMS_1(_name);

private ["_data", "_eventId"];

if (!HASH_HASKEY(GVAR(syncedEvents),_name)) exitWith {
    ACE_LOGERROR(format ["Synced event key not found."]);
    false
};

_data = HASH_GET(GVAR(syncedEvents),_name);
_eventId = _data select 3;

[_eventId] call ace_common_fnc_removeEventHandler;
HASH_REM(GVAR(syncedEvents),_name);
