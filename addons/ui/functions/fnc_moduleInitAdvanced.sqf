/*
 * Author: Jonpas
 * Initializes the UI module.
 *
 * Arguments:
 * 0: Module Logic <LOGIC>
 * 1: Units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

params ["_logic", "_units", "_activated"];

if (!_activated) exitWith {};

[_logic, QGVAR(weaponName), "weaponName"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(weaponNameBackground), "weaponNameBackground"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(firingMode), "firingMode"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(ammoType), "ammoType"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(ammoCount), "ammoCount"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(magCount), "magCount"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(grenadeFlareType), "grenadeFlareType"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(grenadeFlareCount), "grenadeFlareCount"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(zeroing), "zeroing"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(weaponLowerInfoBackground), "weaponLowerInfoBackground"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(stance), "stance"] call EFUNC(common,readSettingFromModule);

[_logic, QGVAR(vehicleName), "vehicleName"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(vehicleNameBackground), "vehicleNameBackground"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(vehicleFuelBar), "vehicleFuelBar"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(vehicleSpeed), "vehicleSpeed"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(vehicleAltitude), "vehicleAltitude"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(vehicleDamage), "vehicleDamage"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(vehicleInfoBackground), "vehicleInfoBackground"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(vehicleGunnerWeapon), "vehicleGunnerWeapon"] call EFUNC(common,readSettingFromModule);

ACE_LOGINFO("User Interface (Advanced) Module Initialized.");
