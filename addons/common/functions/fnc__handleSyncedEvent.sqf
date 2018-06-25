#include "script_component.hpp"
/*
 * Author: jaynus
 * Handles synced events being received. Server will log them, and server/client will execute them.
 *
 * Arguments: [Client]
 * 0: eventName <STRING>
 * 1: arguments <ARRAY>
 * 2: ttl <NUMBER>
 *
 * Return Value:
 * Boolean of success <BOOL>
 *
 * Example:
 * [bob] call ace_common_fnc__handleSyncedEvent
 *
 * Public: No
 */

params ["_name", "_args", "_ttl"];

if !([GVAR(syncedEvents), _name] call CBA_fnc_hashHasKey) exitWith {
    ERROR_1("Synced event key [%1] not found (_handleSyncedEvent).", _name);
    false
};

private _internalData = [GVAR(syncedEvents), _name] call CBA_fnc_hashGet;
_internalData params ["_eventCode", "_eventLog"];

if (isServer) then {
    // Server needs to internally log it for synchronization
    if (_ttl > -1) then {
        _eventLog pushBack [diag_tickTime, _args, _ttl];
    };
};

_args call _eventCode;
