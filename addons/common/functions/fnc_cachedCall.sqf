#include "..\script_component.hpp"
/*
 * Author: esteldunedain, Jaynus
 * Returns the result of the function and caches it up to a given time or event
 *
 * Arguments:
 * 0: Parameters <ANY>
 * 1: Function <CODE>
 * 2: Namespace (any type that supports setVariable) to store the cache on <ANY>
 * 3: Cache uid <STRING>
 * 4: Max duration of the cache <NUMBER>
 * 5: Events that clear the cache <STRING or ARRAY of STRINGs> (default: nil)
 *
 * Return Value:
 * Result of the function <ANY>
 *
 * Example:
 * [[array]], {dothings}, NAMESPACE, "UID", 5, "clear"] call ace_common_fnc_cachedCall
 *
 * Public: No
 */

params ["_params", "_function", "_namespace", "_uid", "_duration", "_events"];

// What it was listed on is kept with the cache, so an expiry does not lose it but the erase that
// empties the lists does
(_namespace getVariable [_uid, [-99999]]) params ["_expiry", "", ["_listedOn", []]];

if (_expiry < diag_tickTime) then {
    // Does the cache need to be cleared on an event?
    if (!isNil "_events") then {
        if (_events isEqualType "") then {
            _events = [_events];
        };

        // Only list it once, rather than again on every recompute
        if (_listedOn isNotEqualTo _events) then {
            {
                private _event = _x;
                private _varName = format [QGVAR(clearCache_%1), _event];
                private _cacheList = missionNamespace getVariable _varName;

                // If there was no EH to clear these caches, add one
                if (isNil "_cacheList") then {
                    _cacheList = [];
                    missionNamespace setVariable [_varName, _cacheList];

                    [_event, {
                        #ifdef DEBUG_MODE_FULL
                            INFO_1("Clear cached variables on event: %1",_eventName);
                        #endif
                        // Get the list of caches to clear
                        //IGNORE_PRIVATE_WARNING ["_eventName"];
                        // _eventName is defined on the function that calls the event
                        private _varName = format [QGVAR(clearCache_%1), _eventName];
                        private _cacheList = missionNamespace getVariable [_varName, []];
                        // Erase all the cached results
                        {
                            _x call FUNC(eraseCache);
                        } forEach _cacheList;
                        // Empty the list
                        missionNamespace setVariable [_varName, []];
                    }] call CBA_fnc_addEventHandler;
                };

                // Add this cache to the list of the event
                _cacheList pushBack [_namespace, _uid];
            } forEach _events;
        };
    };

    _namespace setVariable [_uid, [diag_tickTime + _duration, _params call _function, _events]];

#ifdef DEBUG_MODE_FULL
    INFO_2("Calculated result: %1 %2",_namespace,_uid);
} else {
    INFO_2("Cached result: %1 %2",_namespace,_uid);
#endif

};

(_namespace getVariable _uid) select 1
