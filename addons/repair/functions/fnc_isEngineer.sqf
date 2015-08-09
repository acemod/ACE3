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

params ["_unit", ["_engineerN", 1]];
TRACE_2("params",_unit,_engineerN);

private ["_class"];

_class = _unit getVariable [QGVAR(engineerClass), getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "engineer")];

_class >= (_engineerN min GVAR(engineerSetting_Repair));
