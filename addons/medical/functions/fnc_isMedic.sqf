/*
 * Author: Glowbal, KoffeinFlummi
 * Check if a unit is any medical class
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Class <NUMBER> (default: 1)
 *
 * ReturnValue:
 * Is in of medic class <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_unit", "_class", "_medicN"];
params ["_unit", ["_medicN", 1]];

_class = _unit getVariable [QGVAR(medicClass),
    getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "attendant")];

_class >= _medicN min GVAR(medicSetting)
