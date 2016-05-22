/*
 * Author: commy2
 * Determins type of object. Can be CfgVehicles or CfgAmmo.
 *
 * Arguments:
 * 0: Object classname <STRING>
 *
 * Return Value:
 * Config category ("CfgWeapons", "Cfgmagazines", "CfgGlasses", "") <STRING>
 *
 * Public: Yes
 */
#include "script_component.hpp"

ACE_DEPRECATED("ace_common_fnc_getConfigTypeObject","3.8.0","CBA_fnc_getObjectConfig");

params ["_object"];

if (isClass (configFile >> "CfgVehicles" >> _object)) exitWith {"CfgVehicles"};

if (isClass (configFile >> "CfgAmmo" >> _object)) exitWith {"CfgAmmo"};

""
