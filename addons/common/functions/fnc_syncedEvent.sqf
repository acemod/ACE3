#include "script_component.hpp"
/*
 * Author: jaynus
 * Call and propegate a synced event
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Arguments <ARRAY>
 * 2: TTL <NUMBER, CODE> [Optional] for this specific event call
 *
 * Return Value:
 * Boolean of success <BOOL>
 *
 * Example:
 * ["bob", [args], 5] call ace_common_fnc_syncedEvent
 *
 * Public: No
 */

params ["_name", "_args", ["_ttl", 0]];

if !(_name in GVAR(syncedEvents)) exitWith {
    ERROR_1("Synced event key [%1] not found (syncedEvent).", _name);
    false
};

private _eventData = [_name, _args, _ttl];

["ACEe", _eventData] call CBA_fnc_globalEvent;
