#include "../../script_component.hpp"

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



/*
Description:
    Adds context menu option to inventory display.

Parameters:
    _item                   - Item classname <STRING>
                              Can be base class.

                              Can be item type as reported by BIS_fnc_itemType:
                                ["Equipment","Headgear"]
                                ->
                                "#Equipment" and/or "##Headgear"

                              Wildcard:
                                #All

    _slots                  - Relevant slots <ARRAY, STRING>
                              Values:
                                    CLOTHES
                                        UNIFORM
                                        VEST
                                        BACKPACK
                                        HEADGEAR
                                        GOGGLES

    _displayName            String keys are automatically translated. <STRING, ARRAY>
        0: _displayName     - Option display name <STRING>
        1: _tooltip         - Option tooltip <STRING>

    _color                  - Option text color. Default alpha is 1.
                              (default: [] = default color) <ARRAY>

    _icon                   - Path to icon. (default: "" = no icon) <STRING>

    _condition              <CODE, ARRAY>
        0: _conditionEnable - Menu option is enabled and executed only if this
                              condition reports 'true' (default: {true}) <CODE>
        1: _conditionShow   - Menu option is shown only if this condition
                              reports 'true'. (optional, default: {true}) <CODE>

                            - Passed arguments:
                              params ["_unit", "_container", "_item", "_slot", "_params"];

    _statement              - Option statement (default: {}) <CODE>
                              Return true to keep context menu opened.

                            - Passed arguments:
                              params ["_unit", "_container", "_item", "_slot", "_params"];

    _consume                - Remove the item before executing the statement
                              code. (default: false) <BOOLEAN>

                            - This does NOT work for the following slots:
                                GROUND
                                CARGO

    _params                 - Arguments passed as '_this select 4' to condition and
                              statement (optional, default: []) <ANY>

Returns:
    Nothing/Undefined.

Examples:
    (begin example)
        ["#All", "ALL", ">DEBUG ACTION<", nil, nil, {true}, {
            params ["_unit", "_container", "_item", "_slot", "_params"];
            systemChat str [name _unit, typeOf _container, _item, _slot, _params];
            true
        }, false, [0,1,2]] call CBA_fnc_addItemContextMenuOption;
    (end)
*/



/*

To make this work i would need to add a Menu Option for each individual modfifiable item AND its potential variants.

The most efficient variant i can think of would be following.
1. Event Handler for when the inventory gets open.
2. Get Current Modifiable Items.
3. Check if they are already established (GVAR(contextMenu_hashmap) classname, config)
4. For every new modifiable Item, create a ContextMenuOption for each of its variant
- could make an event handler, everytime the inventory gets opened, it scans the wearables, if they are modifiable, (and not already established) adds the option for those items

*/

/*
    [
        "#ALL",
        "CLOTHES",
    ] call CBA_fnc_addItemContextMenuOption;


*/