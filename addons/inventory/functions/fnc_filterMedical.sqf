#include "script_component.hpp"
/*
 * Author: commy2
 * Filter condition for the Medical filter list
 *
 * Arguments:
 * 0: Item config entry <CONFIG>
 *
 * Return Value:
 * Item should appear in this list? <BOOL>
 *
 * Example:
 * [CONFIG] call ACE_inventory_fnc_filterMedical
 *
 * Public: No
 */

params ["_config"];

toLower configName _config in GVAR(Medical_ItemList)
