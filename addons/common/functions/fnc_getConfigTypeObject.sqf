/*
 * Author: commy2
 *
 * What kind of Cfg is the object. Works for CfgVehicles and CfgAmmo
 *
 * Argument:
 * 0: An object's classname. (String)
 *
 * Return value:
 * CfgWhatever (String)
 */
#include "script_component.hpp"

private "_object";

_object = _this select 0;

if (isClass (configFile >> "CfgVehicles" >> _object)) exitWith {"CfgVehicles"};

if (isClass (configFile >> "CfgAmmo" >> _object)) exitWith {"CfgAmmo"};

""
