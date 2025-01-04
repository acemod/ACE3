#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to return an array the config of desired target items. Also checks if those items exist: CBA_fnc_getItemConfig returns configNull when item not found.
 *
 * Arguments:
 * 0: Current Variant <Config>
 *
 * Return Value:
 * Array of all possible variants as config <ARRAY>
 *
 * Example:
 * [_cfg_current] call ace_wardrobe_fnc_getItems_modifiableTo
 *
 * Public: No
 */

params ["_cfg_current"];

[_cfg_current >> QADDON >> "modifiableTo"] call BIS_fnc_getCfgDataArray apply { [_x] call CBA_fnc_getItemConfig } select { !isNull _x }
