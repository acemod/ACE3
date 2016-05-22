/*
 * Author: commy2
 * Determins type of item. Can be CfgMagaines, CfgWeapons or CfgGlasses.
 *
 * Arguments:
 * 0: Item Classname <STRING>
 *
 * Return Value:
 * Config category ("CfgWeapons", "CfgMagazines", "CfgGlasses", "") <STRING>
 *
 * Public: Yes
 */
#include "script_component.hpp"

ACE_DEPRECATED("ace_common_fnc_getConfigType","3.8.0","CBA_fnc_getItemConfig");

params ["_item"];

if (isClass (configFile >> "CfgWeapons" >> _item)) exitWith {"CfgWeapons"};

if (isClass (configFile >> "CfgMagazines" >> _item)) exitWith {"CfgMagazines"};

if (isClass (configFile >> "CfgGlasses" >> _item)) exitWith {"CfgGlasses"};

""
