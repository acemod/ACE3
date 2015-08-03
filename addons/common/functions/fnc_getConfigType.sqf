/*
 * Author: commy2
 *
 * What kind of Cfg is the item. Works for CfgMagaines, CfgWeapons and CfgGlasses
 *
 * Argument:
 * 0: A item's classname. (String)
 *
 * Return value:
 * CfgWhatever (String)
 */
#include "script_component.hpp"

params ["_item"];

if (isClass (configFile >> "CfgWeapons" >> _item)) exitWith {"CfgWeapons"};

if (isClass (configFile >> "CfgMagazines" >> _item)) exitWith {"CfgMagazines"};

if (isClass (configFile >> "CfgGlasses" >> _item)) exitWith {"CfgGlasses"};

""
