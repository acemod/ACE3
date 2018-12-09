#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Deletes a cached result
 *
 * Arguments:
 * 0: Namespace to store the cache on <NAMESPACE>
 * 1: Cache uid <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [NAMESPACE, "UID"] call ace_common_fnc_eraseCache
 *
 * Public: No
 */

params ["_namespace", "_uid"];

_namespace setVariable [_uid, nil];
