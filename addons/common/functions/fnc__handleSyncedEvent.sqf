/*
 * Author: jaynus
 * Handles synced events being received. Server will log them, and server/client will execute them.
 *
 * Arguments [Client] :
 * 0: eventName <STRING>
 * 1: arguments <ARRAY>
 * 2: ttl <SCALAR><CODE>
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

local _internalData = HASH_GET(GVAR(syncedEvents),_name);
_internalData params ["_eventCode", "_eventLog"];

if (isServer) then {
    // Server needs to internally log it for synchronization
    local _entry = [ACE_diagTime, _args, _ttl];
    local _addToSync = if (typeName _ttl == "CODE") then {
        [_eventCode, _entry] call _ttl;
    } else {
        _ttl > -1
    };
    if (_addToSync) then {
        _eventLog pushback _entry;
    };
};

_args call _eventCode;
