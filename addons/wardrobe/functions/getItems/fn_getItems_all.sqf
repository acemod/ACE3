#include "../../script_component.hpp"

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
    ["_player",   objNull,    [objNull]]
];


// Cleanup Cache once the interaction menu is closed
["items_all"] call FUNC(clearOnClose);
[
    "items_all",
    {
        flatten getUnitLoadout _player select { _x isEqualType "" && { _x != ""}};
    }
] call FUNC(cache_get);