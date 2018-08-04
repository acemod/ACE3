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

[_logic, QGVAR(medicSetting), "medicSetting"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(increaseTrainingInLocations), "increaseTrainingInLocations"] call EFUNC(common,readSettingFromModule);

[_logic, QGVAR(bleedingCoefficient), "bleedingCoefficient"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(painCoefficient), "painCoefficient"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(advancedMedication), "advancedMedication"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(advancedDiagnose), "advancedDiagnose"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(woundReopening), "woundReopening"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(enableScreams), "enableScreams"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(showPainInMenu), "showPainInMenu"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(playerDamageThreshold), "playerDamageThreshold"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(AIDamageThreshold), "AIDamageThreshold"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(fatalInjuryCondition), "fatalInjuryCondition"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(fatalInjuryConditionAI), "fatalInjuryConditionAI"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(unconsciousConditionAI), "unconsciousConditionAI"] call EFUNC(common,readSettingFromModule);

[_logic, QGVAR(cardiacArrestTime), "cardiacArrestTime"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(medicSetting_PainVisualization), "painVisualization"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(medicSetting_Epi), "medicSetting_Epi"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(medicSetting_PAK), "medicSetting_PAK"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(medicSetting_SurgicalKit), "medicSetting_SurgicalKit"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(consumeItem_PAK), "consumeItem_PAK"] call EFUNC(common,readSettingFromModule);

[_logic, QGVAR(consumeItem_SurgicalKit), "consumeItem_SurgicalKit"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(useLocation_Epi), "useLocation_Epi"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(useLocation_PAK), "useLocation_PAK"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(useLocation_SurgicalKit), "useLocation_SurgicalKit"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(allowUnconsciousAnimationOnTreatment), "allowUnconsciousAnimationOnTreatment"] call EFUNC(common,readSettingFromModule);

[_logic, QGVAR(menuTypeStyle), "menuTypeStyle"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(ivFlowRate), "ivFlowRate"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(allowSelfIV), "allowSelfIV"] call EFUNC(common,readSettingFromModule);

[_logic, QGVAR(spontaneousWakeUpChance), "spontaneousWakeUpChance"] call EFUNC(common,readSettingFromModule);

//[_logic, QGVAR(allowLitterCreation), "allowLitterCreation"] call EFUNC(common,readSettingFromModule);
//[_logic, QGVAR(litterCleanUpDelay), "litterCleanUpDelay"] call EFUNC(common,readSettingFromModule);

//[_logic, QGVAR(enableUnconsciousnessAI), "enableUnconsciousnessAI"] call EFUNC(common,readSettingFromModule);
//[_logic, QGVAR(preventInstaDeath), "preventInstaDeath"] call EFUNC(common,readSettingFromModule);

//[_logic, QGVAR(keepLocalSettingsSynced), "keepLocalSettingsSynced"] call EFUNC(common,readSettingFromModule);
// [_logic, QGVAR(delayUnconCaptive), "delayUnconCaptive"] call EFUNC(common,readSettingFromModule);
