#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to store a value behind a key into the addons cache
 *
 * Arguments:
 * 0: Key <STRING>
 * 1: Value <ANY>
 *
 * Return Value:
 * success <BOOL>
 *
 * Example:
 * ['tag_myKey', ["some","data"]] call ace_wardrobe_fnc_cache_set
 *
 * Public: Yes
 */



params [ ["_key", "", [""] ], ["_value", "404"] ];

if (_value isEqualTo "404") exitWith { false };

GVAR(cache) set [_key, _value];

true
