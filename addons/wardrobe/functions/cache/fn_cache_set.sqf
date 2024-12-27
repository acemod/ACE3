#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to store a value into under a key into the addons cache
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

params [ ["_key", "", [""] ], ["_value", "404"] ];

private _db = [] call FUNC(cache_db);

if (_value isEqualTo "404") exitWith { false };

_db set [_key, _value];

true