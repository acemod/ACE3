/*
 * Author: Glowbal
 * Check if vehicle is a medical vehicle
 *
 * Arguments:
 * 0: The Vehicle <OBJECT>
 *
 * ReturnValue:
 * Is in of medic class <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_vehicle"];
_vehicle = _this select 0;

_vehicle getVariable [QGVAR(medicClass), getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "attendant") == 1]
