/**
 * fn_isMedicalVehicle_CMS.sqf
 * @Descr: Check if vehicle is a medical vehicle
 * @Author: Glowbal
 *
 * @Arguments: [vehicle OBJECT]
 * @Return: BOOL
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_veh"];
_veh = _this select 0;

if !(_veh getvariable [QGVAR(isMedicalVehicle), true]) exitwith {false}; // exit in case the false is set.
((getNumber(configFile >> "CfgVehicles" >> typeOf _veh >> QGVAR(isMedicalVehicle)) == 1) || (_veh getvariable [QGVAR(isMedicalVehicle), false]));