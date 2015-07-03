/*
 * Author: Glowbal
 * Check if vehicle is a engineeral vehicle
 *
 * Arguments:
 * 0: The Vehicle <OBJECT>
 *
 * ReturnValue:
 * Is in of engineer class <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_vehicle"];
_vehicle = _this select 0;

if (_vehicle isKindOf "CAManBase") exitwith {false};

((_vehicle getVariable [QGVAR(engineerClass), getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "engineer")]) > 0);
