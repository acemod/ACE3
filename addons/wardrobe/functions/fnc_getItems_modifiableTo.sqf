#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to return an array the config of desired target items. Also checks if those items exist: CBA_fnc_getItemConfig returns configNull when item not found.
*
* Arguments:
*
* Return Value:
* Array of Configs - Available Target configs
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params ["_cfg_current"];

[_cfg_current >> QADDON >> "modifiableTo"] call BIS_fnc_getCfgDataArray apply { [_x] call CBA_fnc_getItemConfig } select { !isNull _x }