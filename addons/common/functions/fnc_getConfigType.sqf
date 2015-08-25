/*
 * Author: commy2
 * Determins type of item. Can be CfgWeapons, CfgMagaines or CfgGlasses.
 *
 * Arguments:
 * 0: Item Classname <STRING>
 *
 * Return Value:
 * Config category ("CfgWeapons", "Cfgmagazines", "CfgGlasses", "") <STRING>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_item"];

if (isClass (configFile >> "CfgWeapons" >> _item)) exitWith {"CfgWeapons"};

if (isClass (configFile >> "CfgMagazines" >> _item)) exitWith {"CfgMagazines"};

if (isClass (configFile >> "CfgGlasses" >> _item)) exitWith {"CfgGlasses"};

""
