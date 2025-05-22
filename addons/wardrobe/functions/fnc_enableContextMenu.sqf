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
 * true call ace_wardrobe_fnc_enableContextMenu
 *
 * Public: No
 */


params [["_enable", true, [true]]];

if (_enable && {!(missionNamespace getVariable [QGVAR(contextmenuEnabled), false])}) then {
    missionNamespace setVariable [QGVAR(contextmenuEnabled), true];

    [
        "#ALL",
        "CLOTHES",
        "Switch to next Variant",
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
