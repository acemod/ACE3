#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to request the clearing of the cache once the Inventory Window gets closed.
 *
 * Arguments:
 * 0: Key <STRING>
 *
 * Return Value:
 * none
 *
 * Example:
 * ["tag_myKeyName"] call ace_wardrobe_fnc_clearOnClosed_Inventory
 *
 * Public: yes
 */

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

nil
