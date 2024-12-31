#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to activate the Wardrobe related CBA Context Menu Options
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


params [["_enable", true, [true]]];


if (missionNamespace getVariable [QGVAR(contextmenu_enabled), false]) then {
    missionNamespace setVariable [QGVAR(contextmenu_enabled), true];


};
