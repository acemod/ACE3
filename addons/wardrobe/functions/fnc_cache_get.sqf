#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * To retrieve a value from the database. returns "404" if not stored or, when provided, will execute the alternative code and return and store said result
 *
 * Arguments:
 * 0: Key <STRING>
 * 1: Code to run when there is no value stored (optional) <CODE>
 *
 * Return Value:
 * Return <ANY> or "404" if no entry found and no code provided
 * 
 *
 * Example:
 * ["tag_loadout", { getUnitLoadout player }] call ace_wardrobe_fnc_cache_get
 *
 * Public: Yes
 */


params [ [ "_key", "", [""] ], [ "_else", "404", [{}] ] ];

if (_else isEqualTo "404") then {
    GVAR(cache) getOrDefault [_key, "404"];
} else {
    GVAR(cache) getOrDefaultCall [_key, _else, true];
};