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
 * Public: No
 */

#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if !(_activated) exitWith {};

[_logic, QGVAR(level), "level"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(medicSetting), "medicSetting"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(increaseTrainingInLocations), "increaseTrainingInLocations"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(allowLitterCreation), "allowLitterCreation"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(litterCleanUpDelay), "litterCleanUpDelay"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(enableScreams), "enableScreams"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(playerDamageThreshold), "playerDamageThreshold"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(AIDamageThreshold), "AIDamageThreshold"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(enableUnconsciousnessAI), "enableUnconsciousnessAI"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(remoteControlledAI), "remoteControlledAI"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(preventInstaDeath), "preventInstaDeath"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(bleedingCoefficient), "bleedingCoefficient"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(painCoefficient), "painCoefficient"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(keepLocalSettingsSynced), "keepLocalSettingsSynced"] call CFUNC(readSettingFromModule);
// [_logic, QGVAR(delayUnconCaptive), "delayUnconCaptive"] call CFUNC(readSettingFromModule);
