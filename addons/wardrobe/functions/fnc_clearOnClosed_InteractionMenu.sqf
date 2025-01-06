#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to request the clearing of the cache on closing of the menu
 *
 * Arguments:
 * 0: The first argument <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["tag_myDataEntry"] call ace_wardrobe_fnc_clearOnClosed_InteractionMenu
 *
 * Public: yes
 */

params [ ["_key", "", [""]] ];

private _queue = missionNamespace getVariable [QGVAR(menu_clear_queue), "404"];

if (_queue isEqualTo "404") then {
    _queue = [];
    [
        "ace_interactMenuClosed",
        {
            if (_this isNotEqualTo [1]) exitWith {};

            { GVAR(cache) deleteAt _x } forEach ( missionNamespace getVariable [QGVAR(menu_clear_queue), [] ] );

            missionNamespace setVariable [QGVAR(menu_clear_queue), nil ];
            [_thisType, _thisId] call CBA_fnc_removeEventHandler;
        }
    ] call CBA_fnc_addEventHandlerArgs;
    missionNamespace setVariable [QGVAR(menu_clear_queue), _queue];
};

_queue pushBackUnique _key;

nil
