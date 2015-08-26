/*
 * Author: joko // Jonas
 * Module for player Breathing
 *
 * Arguments:
 * 0: Logic <OBJECT>
 * 1: Units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIG,SyncUnits, isActivated] call call ace_missionModules_fnc_moduleBreath
 *
 * Public: No
 */
if !(isServer) exitWith {};

params ["_logic", "", "_activated"];

if !(_activated) exitWith {};

[_logic, QGVAR(MaxBreathingDistance), "MaxBreathingDistance"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(breathIsForced), "breathIsForced"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(breathEnabled), "breathEnabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(breathTemperature), "breathTemperature"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(breathTimeStart), "breathTimeStart"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(breathTimeEnd), "breathTimeEnd"] call EFUNC(common,readSettingFromModule);

diag_log text "[ACE]: Player Breathing Module Initialized.";
