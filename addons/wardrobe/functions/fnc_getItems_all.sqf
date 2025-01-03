#include "../script_component.hpp"

/*
* Author: Zorn
* Retrieves a list of items on the user - will be cached for the duration of the interaction.
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

params [
    ["_unit",   objNull,    [objNull]],
    ["_cache",    true,       [true]   ]
];


private _code = { flatten getUnitLoadout _unit select { _x isEqualType "" && { _x != ""}}; };

private _caching = {
    ["items_all"] call FUNC(clearOnClosed_InteractionMenu);
    ["items_all", _code] call FUNC(cache_get);   // returns the result
};

if (_cache) then _caching else _code;
