/*
 * Author: commy2
 * Module for adjusting the repair damage settings
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic"];

if (!isServer) exitWith {};

[_logic, QGVAR(engineerSetting_Repair), "engineerSetting_Repair"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(engineerSetting_Wheel), "engineerSetting_Wheel"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(consumeItem_ToolKit), "consumeItem_ToolKit"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(repairDamageThreshold), "repairDamageThreshold"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(repairDamageThreshold_Engineer), "repairDamageThreshold_Engineer"] call EFUNC(common,readSettingFromModule);


[_logic, QGVAR(fullRepairLocation), "fullRepairLocation"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(engineerSetting_fullRepair), "engineerSetting_fullRepair"] call EFUNC(common,readSettingFromModule);

diag_log text "[ACE]: Repair Module Initialized.";
