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
 * Example:
 * ["myEvent", {_this call x}, 0] call ace_common_fnc_addSyncedEventHandler
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_name", "_handler", ["_ttl", 0]];

if (HASH_HASKEY(GVAR(syncedEvents),_name)) exitWith {
    ACE_LOGERROR_1("Duplicate synced event [%1] creation.",_name);
    false
};

private _eventId = [_name, FUNC(_handleSyncedEvent)] call CBA_fnc_addEventHandler;
private _data = [_handler, [], _ttl, _eventId];

HASH_SET(GVAR(syncedEvents),_name,_data);
