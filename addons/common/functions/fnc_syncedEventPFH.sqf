#include "script_component.hpp"
/*
 * Author: ACE-Team
 *
 * ?
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * None
 *
 * Example:
 * [?] call ace_common_fnc_syncedEventPFH
 *
 * Public: No
 */

if (!isServer) exitWith {false};

// Walk through the local synced events and clean up anything thats already EOL
// @TODO: This should be iteration limited to prevent FPS lag

{
    _y params ["_eventTime", "_eventLog", "_globalEventTTL"];
    private _newEventLog = [];

    // @TODO: This should be iteration limited to prevent FPS lag
    {
        private _eventEntry = _x;
        private _ttlReturn = true;

        if (_globalEventTTL isEqualType {}) then {
            _ttlReturn = [_eventTime, _eventEntry] call _globalEventTTL;
        } else {
            _ttlReturn = call {_globalEventTTL < 1 || {diag_tickTime < (_eventEntry select 0) + _globalEventTTL}};
        };

        if (_ttlReturn) then {
            // Do event based TTL check
            _eventEntry params ["_time", "", "_eventTTL"];

            if (_eventTTL isEqualType {}) then {
                _ttlReturn = [_eventTime, _eventEntry] call _eventTTL;
            } else {
                _ttlReturn = call {_eventTTL < 1 || {diag_tickTime < _time + _eventTTL}};
            };
        };

        // Finally drop it if the TTL check fails
        if (_ttlReturn) then {
            _newEventLog pushBack _x;
        };
    } forEach _eventLog;
    _y set [1, _newEventLog];
} forEach GVAR(syncedEvents);

// @TODO: Next, detect if we had a new request from a JIP player, and we need to continue syncing events
