#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to retrieve modifiable items of a unit. Can be cached for the duration of the interaction menu.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Cache Return? <BOOL>
 *
 * Return Value:
 * modifiable Items of the Unit <ARRAY>
 *
 * Example:
 * [player, false] call ace_wardrobe_fnc_getItems_modifiable_all
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]],
    ["_cache", true, [true]]
];


private _code = {

    [_unit] call FUNC(getItems_all)
    apply
    { [_x] call CBA_fnc_getItemConfig }
    select
    { [_x] call FUNC(isModifiable) }
    apply
    { [_x, [_x] call FUNC(getItems_modifiableTo) ] }
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
    ["items_modifiable_all"] call FUNC(clearOnClosed_InteractionMenu);
    ["items_modifiable_all", _code] call FUNC(cache_get);   // returns the result
};

if (_cache) then _caching else _code;
