#include "../script_component.hpp"

/*
* Author: Zorn
* function to check if the this item is modifiable - returns boolean
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

params [
    ["_cfg",        configNull,         [configNull]       ]
];


if (isNull _cfg) exitWith {false};
// Checks if the config has the property without it being inherited(!)
count ( Q(configName _x  isEqualTo QQPVAR(wardrobe)) configClasses _cfg ) > 0