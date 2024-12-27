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
// Cleanup Cache once the interaction menu is closed

params [ ["_key", "", [""]] ];

private _queue = missionNamespace getVariable [QGVAR(menu_clear_queue), "404"];

if (_queue isEqualTo "404") then {
    _queue = [];
    [
        "ace_interactMenuClosed",
        {
            if (_this isNotEqualTo [1]) exitWith {};

            { [_x] call FUNC(cache_clear) } forEach ( missionNamespace getVariable [QGVAR(menu_clear_queue), [] ] );

            missionNamespace setVariable [QGVAR(menu_clear_queue), nil ];
            [_thisType, _thisId] call CBA_fnc_removeEventHandler;
        }
    ] call CBA_fnc_addEventHandlerArgs;
    missionNamespace setVariable [QGVAR(menu_clear_queue), _queue];
};

_queue pushBackUnique _key;