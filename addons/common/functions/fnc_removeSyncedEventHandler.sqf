/*
 * Author: jaynus
 * Remove a synced event handler
 *
 * Arguments:
 * 0: Name <STRING>
 *
 * Return Value:
 * Boolean of success
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name"];

if (!HASH_HASKEY(GVAR(syncedEvents),_name)) exitWith {
    ACE_LOGERROR("Synced event key not found.");
    false
};

private ["_data", "_eventId"];

_data = HASH_GET(GVAR(syncedEvents),_name);
_eventId = _data select 3;

[_eventId] call FUNC(removeEventHandler);
HASH_REM(GVAR(syncedEvents),_name);
