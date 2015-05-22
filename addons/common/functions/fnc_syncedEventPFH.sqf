//#define DEBUG_MODE_FULL
#include "script_component.hpp"

if(!isServer) exitWith { false };

// Walk through the local synced events and clean up anything thats already EOL
// @TODO: This should be iteration limited to prevent FPS lag
private["_data"];
{
    private["_data", "_eventLog", "_newEventLog", "_name", "_globalEventTTL"];
    _name = _x;

    _data = HASH_GET(GVAR(syncedEvents),_name);
    _eventLog = _data select 1;
    _globalEventTTL = _data select 2; 
    _newEventLog = [];
    
    // @TODO: This should be iteration limited to prevent FPS lag
    {
        private["_eventEntry", "_ttlReturn"];
        _eventEntry = _x;
        
        _ttlReturn = true;
        if(typeName _globalEventTTL == "CODE") then {
            _ttlReturn = [(_data select 0),_eventEntry] call _globalEventTTL;
        } else {
            _ttlReturn = call { _globalEventTTL < 1 || {ACE_diagTime < (_eventEntry select 0) + _globalEventTTL} };
        };

        if(_ttlReturn) then {
            // Do event based TTL check
            private["_eventTTL"];
            _eventTTL = _eventEntry select 2;
            
            if(typeName _eventTTL == "CODE") then {
                _ttlReturn = [(_data select 0),_eventEntry] call _eventTTL;
            } else {
                _ttlReturn = call { _eventTTL < 1 || {ACE_diagTime < (_eventEntry select 0) + _eventTTL} };
            };
        };

        // Finally drop it if the TTL check fails
        if(_ttlReturn) then {
            _newEventLog pushBack _x;
        };
    } forEach _eventLog;
    
    _data set[1, _newEventLog];
} forEach (GVAR(syncedEvents) select 0);


// @TODO: Next, detect if we had a new request from a JIP player, and we need to continue syncing events
