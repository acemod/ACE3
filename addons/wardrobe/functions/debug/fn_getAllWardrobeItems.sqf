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

["CfgWeapons"] apply { ( Q([_x] call FUNC(isModifiable)) configClasses (configFile >> _x) ) apply { configName _x } }