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
 * [_cfgCurrent] call ace_wardrobe_fnc_getItemsModifiableTo
 *
 * Public: No
 */

params ["_cfgCurrent"];

/* OLD
[_cfgCurrent >> QUOTE(ADDON) >> "modifiableTo"] call BIS_fnc_getCfgDataArray apply { [_x] call CBA_fnc_getItemConfig } select { !isNull _x }
*/

"true" configClasses (configFile >> QUOTE(ADDON) >> configName _cfgCurrent >> "modifiableTo") apply { [configName _x] call CBA_fnc_getItemConfig } select { !isNull _x }
