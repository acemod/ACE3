/*
 * Author: SzwedzikPL
 * Checks if item is a map
 *
 * Arguments:
 * 0: Item class <STRING>
 *
 * Return Value:
 * true if given item is a map <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_item"];

getNumber (configFile >> "CfgWeapons" >> _item >> QGVAR(isMap)) > 0
