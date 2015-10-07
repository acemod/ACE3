/*
 * Author: jaynus
 * Handles synced events being received. Server will log them, and server/client will execute them.
 *
 * Arguments [Client] :
 * 0: eventName <STRING>
 * 1: arguments <ARRAY>
 * 2: ttl <SCALAR>
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

private ["_internalData", "_eventCode"];

_internalData = HASH_GET(GVAR(syncedEvents),_name);

if (isServer) then {
    // Server needs to internally log it for synchronization
    if (_ttl > -1) then {
        _internalData = HASH_GET(GVAR(syncedEvents),_name);

        private "_eventLog";
        _eventLog = _internalData select 1;
        _eventLog pushback [ACE_diagTime, _args, _ttl];
    };
};

_eventCode = _internalData select 0;
_args call _eventCode;
