#include "script_component.hpp"
/*
 * Author: jaynus
 * Remove a synced event handler
 *
 * Arguments:
 * 0: Name <STRING>
 *
 * Return Value:
 * Boolean of success <BOOL>
 *
 * Example:
 * ["bob"] call ace_common_fnc_removeSyncedEventHandler
 *
 * Public: No
 */

params ["_name"];

if !(_name in GVAR(syncedEvents)) exitWith {
    ERROR_1("Synced event key [%1] not found (removeSyncedEventHandler).", _name);
    false
};

private _data = GVAR(syncedEvents) get _name;
_data params ["", "", "", "_eventId"];

[_eventId] call CBA_fnc_removeEventHandler;
GVAR(syncedEvents) deleteAt _name;
