/*
 * Author: esteldunedain, Jaynus
 * Returns the result of the function and caches it up to a given time or event
 *
 * Arguments:
 * 0: Parameters <ARRAY>
 * 1: Function <CODE>
 * 2: Namespace to store the cache on <NAMESPACE>
 * 3: Cache uid <STRING>
 * 4: Max duration of the cache <NUMBER>
 * 5: Event that clears the cache (default: nil) <STRING>
 *
 * Return Value:
 * Result of the function <ANY>
 *
 * Example:
 * [[array]], {dothings}, NAMESPACE, "UID", 5, "clear"] call ace_common_fnc_cachedCall
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_params", "_function", "_namespace", "_uid", "_duration", "_event"];

if ((_namespace getVariable [_uid, [-99999]]) select 0 < diag_tickTime) then {
    _namespace setVariable [_uid, [diag_tickTime + _duration, _params call _function]];

    // Does the cache needs to be cleared on an event?
    if (!isNil "_event") then {
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
    };

#ifdef DEBUG_MODE_FULL
    INFO_2("Calculated result: %1 %2",_namespace,_uid);
} else {
    INFO_2("Cached result: %1 %2",_namespace,_uid);
#endif

};

(_namespace getVariable _uid) select 1
