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
    ["_player",   objNull,    [objNull]]
];

// Cleanup Cache once the interaction menu is closed
["items_modifiable_current"] call FUNC(clearOnClose);
[
    "items_modifiable_current",
    {
        private _array = [];
        {
            private _cfg = [_x] call CBA_fnc_getItemConfig;
            if ( [_cfg] call FUNC(checkItem) && { count ([_cfg >> QADDON >> "modifiableTo"] call BIS_fnc_getCfgDataArray) > 0 } )  then { _array pushBack _x; };

        } forEach ( [headgear _player, goggles _player, uniform _player, vest _player, backpack _player] - [""] );
        _array
    }
] call FUNC(cache_get);