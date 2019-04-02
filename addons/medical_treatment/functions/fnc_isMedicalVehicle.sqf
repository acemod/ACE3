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
 * [cursorObject] call ace_medical_treatment_fnc_isMedicalVehicle
 *
 * Public: No
 */

params ["_vehicle"];

(_vehicle getVariable [QEGVAR(medical,medicClass), getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "attendant")]) > 0
