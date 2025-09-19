#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Lists the available variants of an item.
 *
 * Arguments:
 * 0: Item config <CONFIG>
 *
 * Return Value:
 * Array of all possible variants <ARRAY of CONFIGs>
 *
 * Example:
 * (configFile >> "CfgWeapons" >> "U_B_CTRG_1") call ace_wardrobe_fnc_getItemVariants
 *
 * Public: No
 */

params ["_cfgCurrent"];

"true" configClasses (configFile >> QUOTE(ADDON) >> configName _cfgCurrent >> "modifiableTo")
    apply { [configName _x] call CBA_fnc_getItemConfig }
    select { !isNull _x }
