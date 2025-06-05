#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to retrieve currently worn, modifiable items. Return can be cached - for the duration of the interaction menu.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Cache return? <BOOL>
 *
 * Return Value:
 * modifiable Items of the Unit <ARRAY>
 *
 * Example:
 * [player, false] call ace_wardrobe_fnc_getItemsModifiableCurrent
 *
 * Public: Yes
 */

params [["_player", objNull, [objNull]], ["_cache", true, [true]]];

private _code = {
    ([headgear _player, goggles _player, uniform _player, vest _player, backpack _player] - [""])
    apply
    { _x call CBA_fnc_getItemConfig }
    select
    { _x call FUNC(isModifiable) }
    apply
    { [_x, _x call FUNC(getItemsModifiableTo)] }    // will return an array, even if the target variants are not available
    select
    { (_x#1) isNotEqualTo [] }
    apply
    {
        private _cfgOrigin = _x#0;
        [
            _cfgOrigin,
            _x#1 select { [_player, _cfgOrigin, _x] call FUNC(canModifyTo) }
        ]
    }
    select
    { (_x#1) isNotEqualTo [] }
};
    

private _caching = {
    ["items_modifiable_current"] call FUNC(clearOnClosedInteractionMenu);
    ["items_modifiable_current", _code] call FUNC(cacheGet);   // returns the result
};

if (_cache) then _caching else _code;
