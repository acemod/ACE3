/*
 * Author: Glowbal, KoffeinFlummi, commy2
 * Check if a unit is any engineer class
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Class <NUMBER> <OPTIONAL>
 *
 * ReturnValue:
 * Is in of engineer class <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_unit", "_engineerN", "_class"];

_unit = _this select 0;
_engineerN = if (count _this > 1) then {_this select 1} else {1};

_class = _unit getVariable [QGVAR(engineerClass),
    getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "engineer")
];

_class >= _engineerN min GVAR(engineerSetting_Repair)
