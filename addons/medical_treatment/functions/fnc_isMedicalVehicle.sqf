#include "script_component.hpp"
/*
 * Author: Glowbal
 * Checks if the vehicle is a medical vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Is Medical Vehicle <BOOL>
 *
 * Example:
 * [cursorObject] call ace_medical_treatment_fnc_isMedicalVehicle
 *
 * Public: No
 */

params ["_vehicle"];

_vehicle getVariable [QEGVAR(medical,isMedicalVehicle), getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "attendant") > 0]
