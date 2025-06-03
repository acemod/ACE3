#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to request the clearing of the cache upon closing of the menu.
 *
 * Arguments:
 * 0: Key <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["tag_myDataEntry"] call ace_wardrobe_fnc_clearOnClosedInteractionMenu
 *
 * Public: yes
 */

params [ ["_key", "", [""]] ];


if (isNil QGVAR(menuClearQueue)) then {

    [
        "ace_interactMenuClosed",
        {
            if (_this isNotEqualTo [1]) exitWith {};

            { GVAR(cache) deleteAt _x } forEach ( missionNamespace getVariable [QGVAR(menuClearQueue), [] ] );

            GVAR(menuClearQueue) = nil;
            [_thisType, _thisId] call CBA_fnc_removeEventHandler;
        }
    ] call CBA_fnc_addEventHandlerArgs;

    GVAR(menuClearQueue) = [_key];

} else {

    GVAR(menuClearQueue) pushBackUnique _key;

};

nil
