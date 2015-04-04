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
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_logic", "_units", "_activated"];
_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {};

[_logic, QGVAR(medicSetting), "medicSetting"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(maxReviveTime), "maxReviveTime"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(amountOfReviveLives), "amountOfReviveLives"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(enableOverdosing), "enableOverdosing"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(allowLitterCreation), "allowLitterCreation"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(litterCleanUpDelay), "litterCleanUpDelay"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(medicSetting_PAK), "medicSetting_PAK"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(medicSetting_SurgicalKit), "medicSetting_SurgicalKit"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(consumeItem_PAK), "consumeItem_PAK"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(consumeItem_SurgicalKit), "consumeItem_SurgicalKit"] call EFUNC(common,readSettingFromModule);
