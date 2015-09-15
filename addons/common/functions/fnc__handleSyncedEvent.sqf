/*
 * Author: jaynus
 *
 * Handles synced events being received. Server will log them, and server/client will execute them.
 *
 * Arguments [Client] :
 * 0: eventName (String)
 * 1: arguments (Array)
 * 2: ttl (Scalar)
 *
 * Return value:
 * Boolean of success
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"
PARAMS_3(_name,_args,_ttl);
private["_internalData", "_eventLog", "_eventCode"];

if(!HASH_HASKEY(GVAR(syncedEvents),_name)) exitWith {
    ACE_LOGERROR("Synced event key not found.");
    false
};

_internalData = HASH_GET(GVAR(syncedEvents),_name);

if(isServer) then {
    // Server needs to internally log it for synchronization
    if(_ttl > -1) then {
        _internalData = HASH_GET(GVAR(syncedEvents),_name);
        _eventLog = _internalData select 1;
        _eventLog pushback [ACE_diagTime, _args, _ttl];
    };
};

_eventCode = _internalData select 0;
_args call _eventCode;
