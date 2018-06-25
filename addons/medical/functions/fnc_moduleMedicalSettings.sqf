#include "script_component.hpp"
/*
 * Author: Glowbal
 * Module for adjusting the medical damage settings
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ACE_medical_fnc_moduleMedicalSettings
 *
 * Public: No
 */

params ["_logic", "_units", "_activated"];

if !(_activated) exitWith {};

[_logic, QGVAR(level), "level"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(medicSetting), "medicSetting"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(increaseTrainingInLocations), "increaseTrainingInLocations"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(allowLitterCreation), "allowLitterCreation"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(litterCleanUpDelay), "litterCleanUpDelay"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(enableScreams), "enableScreams"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(playerDamageThreshold), "playerDamageThreshold"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(AIDamageThreshold), "AIDamageThreshold"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(enableUnconsciousnessAI), "enableUnconsciousnessAI"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(remoteControlledAI), "remoteControlledAI"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(preventInstaDeath), "preventInstaDeath"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(bleedingCoefficient), "bleedingCoefficient"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(painCoefficient), "painCoefficient"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(keepLocalSettingsSynced), "keepLocalSettingsSynced"] call EFUNC(common,readSettingFromModule);
// [_logic, QGVAR(delayUnconCaptive), "delayUnconCaptive"] call EFUNC(common,readSettingFromModule);
