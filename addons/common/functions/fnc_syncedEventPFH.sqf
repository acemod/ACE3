/*
 * Author: ?
 *
 * ?
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * ?
 *
 * Public: ?
 */
#include "script_component.hpp"

if(!isServer) exitWith { false };
private "_newEventLog";
// Walk through the local synced events and clean up anything thats already EOL
// @TODO: This should be iteration limited to prevent FPS lag
{
    private["_data", "_name"];
    _name = _x;

    _data = HASH_GET(GVAR(syncedEvents),_name);
    _data params ["", "_eventLog", "_globalEventTTL"];
    _newEventLog = [];

    // @TODO: This should be iteration limited to prevent FPS lag
    {
        private["_eventEntry", "_ttlReturn"];
        _eventEntry = _x;

        _ttlReturn = true;
        if(typeName _globalEventTTL == "CODE") then {
            _ttlReturn = [_eventLog, _eventEntry] call _globalEventTTL;
        } else {
            _ttlReturn = call { _globalEventTTL < 1 || {ACE_diagTime < (_eventEntry select 0) + _globalEventTTL} };
        };

        if(_ttlReturn) then {
            // Do event based TTL check
            _eventEntry params ["_time", "", "_eventTTL"];

            if(typeName _eventTTL == "CODE") then {
                _ttlReturn = [_eventLog,_eventEntry] call _eventTTL;
            } else {
                _ttlReturn = call { _eventTTL < 1 || {ACE_diagTime < _time + _eventTTL} };
            };
        };

        // Finally drop it if the TTL check fails
        if(_ttlReturn) then {
            _newEventLog pushBack _x;
        };
    } count _eventLog;

    _data set [1, _newEventLog];
    true
} count (GVAR(syncedEvents) select 0);


// @TODO: Next, detect if we had a new request from a JIP player, and we need to continue syncing events
