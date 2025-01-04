#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to create the CBA ContextMenu Option to switch to the (randomly choosen) next Variant of the current Version.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * none
 *
 * Example:
 * [] call ace_wardrobe_fnc_addCM_nextvariant
 *
 * Public: No
 */

[
    "#ALL",                                     // filter items
    "CLOTHES",                                  // filter slots
    "Switch to next Variant",                   // Display Name
    [],                                         // Color
    QPATHTOF(data\wardrobe_logo.paa),    // Icon
    [
        {true},                                 // Condition Enable action
        {true}                                  // Condition Show Action
    ],
    FUNC(do_nextVariant),                       // statement
    false,                                      // consume Item
    []                                          // Params
] call CBA_fnc_addItemContextMenuOption;
