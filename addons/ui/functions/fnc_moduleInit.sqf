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

// Exit if HUD visibility is hardcoded in mission config and showHUD command is overriden
if (isArray (missionConfigFile >> "showHUD")) exitWith {
    ACE_LOGINFO("User Interface (Basic) Module Failed to Initialize - showHUD overriden in mission config!");
};

[_logic, QGVAR(soldierVehicleWeaponInfo), "soldierVehicleWeaponInfo"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(vehicleRadar), "vehicleRadar"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(vehicleCompass), "vehicleCompass"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(commandMenu), "commandMenu"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(groupBar), "groupBar"] call EFUNC(common,readSettingFromModule);

ACE_LOGINFO("User Interface (Basic) Module Initialized.");
