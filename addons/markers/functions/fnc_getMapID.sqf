/*
 * Author: SzwedzikPL
 * Returns map id
 *
 * Arguments:
 * 0: Map classname <STRING>
 *
 * Return Value:
 * Map ID <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_map"];

getNumber (configFile >> "CfgWeapons" >> _map >> QGVAR(mapID))
