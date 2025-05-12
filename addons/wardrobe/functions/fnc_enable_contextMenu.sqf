#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * CBA Setting - On Setting Changed - Function to activate the Wardrobe-related CBA Context Menu Options
 *
 * Arguments:
 * 0: CBA Setting Value <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_wardrobe_fnc_enable_contextMenu
 *
 * Public: No
 */


params [["_enable", true, [true]]];

if (_enable && {!(missionNamespace getVariable [QGVAR(contextmenu_enabled), false])}) then {
    missionNamespace setVariable [QGVAR(contextmenu_enabled), true];

    [
        "#ALL",
        "CLOTHES",
        "Switch to next Variant",
        [],
        QPATHTOF(data\wardrobe_logo.paa),
        [
            { isNil QGVAR(api_disable) },
            { isNil QGVAR(api_disable) }
        ],
        FUNC(nextVariant_do),
        false,
        []
    ] call CBA_fnc_addItemContextMenuOption;
};
