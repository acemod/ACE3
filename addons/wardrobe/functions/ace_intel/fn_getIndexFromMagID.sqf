#include "../../script_component.hpp"

/*
* Author: Zorn
* function to return the data index based of the magazine ID
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
    ["_magazineID", "", [""] ]
];

if !(_magazineID in allVariables ace_intelItems_intelMap) exitWith { -1 };

ace_intelItems_intelMap getVariable _magazineID
