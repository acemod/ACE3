#include "script_component.hpp"
/*
 * Author: commy2
 * Filter condition for the Headgear filter list
 *
 * Arguments:
 * 0: Item config entry <CONFIG>
 *
 * Return Value:
 * Item should appear in this list? <BOOL>
 *
 * Example:
 * [CONFIG] call ACE_inventory_fnc_filterHeadgear
 *
 * Public: No
 */

params ["_config"];

getNumber (_config >> "ItemInfo" >> "type") in [TYPE_HEADGEAR, TYPE_HMD] || {isClass (configFile >> "CfgGlasses" >> configName _config)}
