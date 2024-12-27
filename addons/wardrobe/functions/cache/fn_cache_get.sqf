#include "../../script_component.hpp"

/*
* Author: Zorn
* function to retrieve a value from the database. returns "404" if not stored or, when provided will execute the alternative code and store said result.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params [ [ "_key", "", [""] ], [ "_else", "404", [{}] ] ];

if (_else isEqualTo "404") then {
    [] call FUNC(cache_db) getOrDefault [_key, "404"];
} else {
    [] call FUNC(cache_db) getOrDefaultCall [_key, _else, true];
};
