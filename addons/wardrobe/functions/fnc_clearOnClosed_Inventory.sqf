#include "../script_component.hpp"

/*
* Author: Zorn
* Function to request the clearing of the cache on closing of the menu
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
// Cleanup Cache once the inventory is closed

params [ ["_key", "", [""]] ];

private _queue = missionNamespace getVariable [QGVAR(inventory_clear_queue), "404"];

if (_queue isEqualTo "404") then {
    
    _queue = [];

    player addEventHandler ["InventoryClosed", {
        { [_x] call FUNC(cache_clear) } forEach ( missionNamespace getVariable [QGVAR(inventory_clear_queue), [] ] );
        missionNamespace setVariable [QGVAR(inventory_clear_queue), nil ];
        player removeEventHandler [_thisEvent, _thisEventhandler];
    }];
    missionNamespace setVariable [QGVAR(inventory_clear_queue), _queue];
};

_queue pushBackUnique _key;