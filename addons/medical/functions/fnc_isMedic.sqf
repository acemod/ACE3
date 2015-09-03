/*
 * Author: Glowbal, KoffeinFlummi
 * Check if a unit is any medical class
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Class <NUMBER> <OPTIONAL>
 *
 * ReturnValue:
 * Is in of medic class <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_unit", "_class", "_medicN"];
_unit = _this select 0;
_medicN = if (count _this > 1) then {_this select 1} else {1};

_class = _unit getVariable [QGVAR(medicClass),
    getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "attendant")];

_class >= _medicN min GVAR(medicSetting)
