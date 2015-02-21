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

private ["_veh"];
_veh = _this select 0;

if !(_veh getvariable [QGVAR(isMedicalVehicle), true]) exitwith {false}; // exit in case the false is set.
((getNumber(configFile >> "CfgVehicles" >> typeOf _veh >> QGVAR(isMedicalVehicle)) == 1) || (_veh getvariable [QGVAR(isMedicalVehicle), false]));
