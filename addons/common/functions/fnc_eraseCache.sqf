/*
 * Author: esteldunedain
 * Deletes a cached result
 *
 * Arguments:
 * 0: Namespace to store the cache on (NAMESPACE)
 * 1: Cache uid (STRING)
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_namespace", "_uid"];

_namespace setVariable [_uid, nil];
