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
 * Modifiable items of the unit <ARRAY>
 *
 * Example:
 * [player, false] call ace_wardrobe_fnc_getItemsModifiableAll
 *
 * Public: Yes
 */

params [["_player", objNull, [objNull]], ["_cache", true, [true]]];

private _code = {
    _player call FUNC(getItemsAll)
    apply
    { _x call CBA_fnc_getItemConfig }
    select
    { _x call FUNC(isModifiable) }
    apply
    { [_x, _x call FUNC(getItemsModifiableTo)] }
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
    ["items_modifiable_all"] call FUNC(clearOnClosedInteractionMenu);
    ["items_modifiable_all", _code] call FUNC(cacheGet);   // returns the result
};

if (_cache) then _caching else _code;
