/*
 * Author: commy2
 * Determins type of object. Can be CfgVehicles or CfgAmmo.
 *
 * Arguments:
 * 0: Object Classname <STRING>
 *
 * Return Value:
 * Config Category ("CfgVehicles", "CfgAmmo", "") <STRING>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object"];

if (isClass (configFile >> "CfgVehicles" >> _object)) exitWith {"CfgVehicles"};

if (isClass (configFile >> "CfgAmmo" >> _object)) exitWith {"CfgAmmo"};

""
