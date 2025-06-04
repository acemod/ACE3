#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to store a value behind a key into the addons cache.
 *
 * Arguments:
 * 0: Key <STRING>
 * 1: Value <ANY>
 *
 * Return Value:
 * Success <BOOL>
 *
 * Example:
 * ['tag_myKey', ["some", "data"]] call ace_wardrobe_fnc_cacheSet
 *
 * Public: Yes
 */

params [ ["_key", "", [""] ], ["_value", nil] ];

if (isNil "_value") exitWith { false };

GVAR(cache) set [_key, _value];

true
