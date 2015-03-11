/*
 * Author: CAA-Picard and Jaynus
 * Returns the result of the function and caches it up to a given time
 *
 * Arguments:
 * 0: Parameters <ARRAY>
 * 1: Function <CODE>
 * 2: Namespace to store the cache on <NAMESPACE>
 * 3: Cache uid <STRING>
 * 4: Max duration of the cache <NUMBER>
 *
 * Return Value:
 * Result of the function <ANY>
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_5_PVT(_this,_params,_function,_namespace,_uid,_duration);

if (((_namespace getVariable [_uid, [-99999]]) select 0) < diag_tickTime) then {
    _namespace setVariable [_uid, [diag_tickTime + _duration, _params call _function]];
#ifdef DEBUG_MODE_FULL
    diag_log format ["Calculated result: %1 %2", _namespace, _uid];
} else {
	diag_log format ["Cached result    : %1 %2", _namespace, _uid];
#endif
};

(_namespace getVariable _uid) select 1
