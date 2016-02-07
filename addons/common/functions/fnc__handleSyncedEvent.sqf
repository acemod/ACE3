/*
 * Author: jaynus
 * Handles synced events being received. Server will log them, and server/client will execute them.
 *
 * Arguments [Client] :
 * 0: eventName <STRING>
 * 1: arguments <ARRAY>
 * 2: ttl <NUMBER>
 *
 * Return Value:
 * Boolean of success <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name", "_args", "_ttl"];

if (!HASH_HASKEY(GVAR(syncedEvents),_name)) exitWith {
    ACE_LOGERROR("Synced event key not found.");
    false
};

private _internalData = HASH_GET(GVAR(syncedEvents),_name);

if (isServer) then {
    // Server needs to internally log it for synchronization
    if (_ttl > -1) then {
        _internalData = HASH_GET(GVAR(syncedEvents),_name);

        _internalData params ["", "_eventLog"];
        _eventLog pushBack [ACE_diagTime, _args, _ttl];
    };
};

_internalData params ["_eventCode"];
_args call _eventCode;
