/*
 * Author: Glowbal
 * Module for adjusting the medical treatment settings
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
 * [LOGIC, [bob, kevin], true] call ACE_medical_fnc_moduleAdvancedMedicalSettings
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if !(_activated) exitWith {};

[_logic, QGVAR(enableFor), "enableFor"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(enableAdvancedWounds), "enableAdvancedWounds"] call EFUNC(common,readSettingFromModule);
// TODO disabled until implemented
// [_logic, QGVAR(enableAirway), "enableAirway"] call EFUNC(common,readSettingFromModule);
// [_logic, QGVAR(enableFractures), "enableFractures"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(medicSetting_PAK), "medicSetting_PAK"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(medicSetting_SurgicalKit), "medicSetting_SurgicalKit"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(consumeItem_PAK), "consumeItem_PAK"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(consumeItem_SurgicalKit), "consumeItem_SurgicalKit"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(useLocation_PAK), "useLocation_PAK"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(useLocation_SurgicalKit), "useLocation_SurgicalKit"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(useCondition_PAK), "useCondition_PAK"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(useCondition_SurgicalKit), "useCondition_SurgicalKit"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(healHitPointAfterAdvBandage), "healHitPointAfterAdvBandage"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(painIsOnlySuppressed), "painIsOnlySuppressed"] call EFUNC(common,readSettingFromModule);
