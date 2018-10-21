#include "script_component.hpp"
/*
 * Author: Glowbal
 * Check if vehicle is a medical vehicle
 *
 * Arguments:
 * 0: The Vehicle <OBJECT>
 *
 * Return Value:
 * Is in of medic class <BOOL>
 *
 * Example:
 * [car] call ace_medical_fnc_isMedicalVehicle
 *
 * Public: Yes
 */

params ["_vehicle"];

(_vehicle getVariable [QGVAR(medicClass), getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "attendant")]) > 0
