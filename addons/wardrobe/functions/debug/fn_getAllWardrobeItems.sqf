#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to retrieve all Wardrobe Items.
*
* Arguments:
*
* Return Value:
* Nested Array of Classnames that have the wardrobe properties. One Entry per Cfg Group (currently just CfgWeapons)
*
* Example:
* [] call prefix_component_fnc_functionname
*
* Public: No
*/

[
    "allWardrobeItems",
    {
        ["CfgWeapons"] apply { ( Q([_x] call FUNC(checkItem)) configClasses (configFile >> _x) ) apply { configName _x } }
    }
] call FUNC(cache_get);

