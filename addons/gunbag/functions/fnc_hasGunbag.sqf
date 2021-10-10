#include "script_component.hpp"
/*
 * Author: Ir0n1E
 * Check if unit has a gunbag.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Has Gunbag <BOOL>
 *
 * Example:
 * [player] call ace_gunbag_fnc_hasGunbag
 *
 * Public: No
 */

params ["_unit"];

getNumber (configFile >> "CfgVehicles" >> (backpack _unit) >> QUOTE(ADDON)) == 1
