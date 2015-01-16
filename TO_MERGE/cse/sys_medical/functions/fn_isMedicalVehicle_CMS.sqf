/**
 * fn_isMedicalVehicle_CMS.sqf
 * @Descr: Check if vehicle is a medical vehicle
 * @Author: Glowbal
 *
 * @Arguments: [vehicle OBJECT]
 * @Return: BOOL
 * @PublicAPI: true
 */

private ["_veh"];
_veh = _this select 0;

if !(_veh getvariable ["cse_medicalVehicle_CMS", true]) exitwith {false}; // exit in case the false is set.
((getNumber(configFile >> "CfgVehicles" >> typeOf _veh >> "cse_medicalVehicle") == 1) || (_veh getvariable ["cse_medicalVehicle_CMS", false]));