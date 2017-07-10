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
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_ui_fnc_moduleInit
 *
 * Public: No
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

params ["_logic", "_units", "_activated"];

if (!_activated) exitWith {};

[_logic, QGVAR(allowSelectiveUI), "allowSelectiveUI"] call EFUNC(common,readSettingFromModule);

// Basic
if (isArray (missionConfigFile >> "showHUD")) then {
    // HUD visibility is hardcoded in mission config and showHUD command is overriden
    INFO("User Interface Module Failed to Initialize Basic settings - showHUD overriden in mission config!");
} else {
    [_logic, QGVAR(soldierVehicleWeaponInfo), "soldierVehicleWeaponInfo"] call EFUNC(common,readSettingFromModule);
    [_logic, QGVAR(vehicleRadar), "vehicleRadar"] call EFUNC(common,readSettingFromModule);
    [_logic, QGVAR(vehicleCompass), "vehicleCompass"] call EFUNC(common,readSettingFromModule);
    [_logic, QGVAR(commandMenu), "commandMenu"] call EFUNC(common,readSettingFromModule);
    [_logic, QGVAR(groupBar), "groupBar"] call EFUNC(common,readSettingFromModule);
};

// Advanced
[_logic, QGVAR(weaponName), "weaponName"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(weaponNameBackground), "weaponNameBackground"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(firingMode), "firingMode"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(ammoType), "ammoType"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(ammoCount), "ammoCount"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(magCount), "magCount"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(throwableName), "throwableName"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(throwableCount), "throwableCount"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(zeroing), "zeroing"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(weaponLowerInfoBackground), "weaponLowerInfoBackground"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(stance), "stance"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(staminaBar), "staminaBar"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(gunnerWeaponName), "gunnerWeaponName"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(gunnerWeaponNameBackground), "gunnerWeaponNameBackground"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(gunnerFiringMode), "gunnerFiringMode"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(gunnerAmmoType), "gunnerAmmoType"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(gunnerAmmoCount), "gunnerAmmoCount"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(gunnerMagCount), "gunnerMagCount"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(gunnerLaunchableName), "gunnerLaunchableName"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(gunnerLaunchableCount), "gunnerLaunchableCount"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(gunnerZeroing), "gunnerZeroing"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(gunnerWeaponLowerInfoBackground), "gunnerWeaponLowerInfoBackground"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(vehicleName), "vehicleName"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(vehicleNameBackground), "vehicleNameBackground"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(vehicleFuelBar), "vehicleFuelBar"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(vehicleSpeed), "vehicleSpeed"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(vehicleAltitude), "vehicleAltitude"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(vehicleDamage), "vehicleDamage"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(vehicleInfoBackground), "vehicleInfoBackground"] call EFUNC(common,readSettingFromModule);

INFO_1("User Interface Module Initialized. Allow client modifications: %1",GVAR(allowSelectiveUI));
