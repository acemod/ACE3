#include "../script_component.hpp"

/*
* Author: Zorn
* Function to create the CM Option to switch to the "next" Variant of the current Version.
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
