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
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name"];

private ["_data", "_eventId"];

if (!HASH_HASKEY(GVAR(syncedEvents),_name)) exitWith {
    diag_log text format["[ACE] Error, synced event key not found."];
    false
};

_data = HASH_GET(GVAR(syncedEvents),_name);
_eventId = _data select 3;

[_eventId] call ace_common_fnc_removeEventHandler;
HASH_REM(GVAR(syncedEvents),_name);
