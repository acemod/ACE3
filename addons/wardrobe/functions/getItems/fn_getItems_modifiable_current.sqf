#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to retrieve currently worn, modifiable items. Cached Array for the duration of the interaction menu.
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


private _code = {

    ( [headgear _unit, goggles _unit, uniform _unit, vest _unit, backpack _unit] - [""] )
    apply
    { [_x] call CBA_fnc_getItemConfig }
    select
    { [_x] call FUNC(isModifiable) }
    apply
    { [_x, [_x] call FUNC(getItems_modifiableTo) ] }    // will return an array, even if the target variants are not available.
    select
    { count (_x#1) > 0 }
    apply
    {
        private _origin_cfg = _x#0;
        [
            _origin_cfg,
            _x#1 select { [_unit, _origin_cfg, _x] call FUNC(canModifyTo) }
        ]
    }
    select
    { count (_x#1) > 0 }
};
    

private _caching = {
    ["items_modifiable_current"] call FUNC(clearOnClosed_InteractionMenu);
    ["items_modifiable_current", _code] call FUNC(cache_get);   // returns the result
};

if (_cache) then _caching else _code;
