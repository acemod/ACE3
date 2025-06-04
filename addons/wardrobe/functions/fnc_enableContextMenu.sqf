#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * CBA Setting - on setting changed - function to activate the wardrobe-related cba context menu options.
 *
 * Arguments:
 * 0: CBA Setting Value <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * true call ace_wardrobe_fnc_enableContextMenu
 *
 * Public: No
 */

params [["_enable", true, [true]]];

if (_enable && { !(missionNamespace getVariable [QGVAR(contextmenuEnabled), false]) }) then {
    missionNamespace setVariable [QGVAR(contextmenuEnabled), true];

    [
        "#ALL",
        "CLOTHES",
        "Switch to next variant",
        [],
        QPATHTOF(data\wardrobe_logo.paa),
        [
            { GVAR(enableContextMenu) },
            { GVAR(enableContextMenu) }
        ],
        FUNC(nextVariantDo),
        false,
        []
    ] call CBA_fnc_addItemContextMenuOption;
};
