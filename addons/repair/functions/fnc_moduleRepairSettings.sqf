/*
 * Author: commy2
 * Adjusts repair damage settings.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [logic] call ace_repair_fnc_moduleRepairSettings
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic"];

[_logic, QGVAR(engineerSetting_Repair), "engineerSetting_Repair"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(engineerSetting_Wheel), "engineerSetting_Wheel"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(consumeItem_ToolKit), "consumeItem_ToolKit"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(repairDamageThreshold), "repairDamageThreshold"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(repairDamageThreshold_Engineer), "repairDamageThreshold_Engineer"] call EFUNC(common,readSettingFromModule);


[_logic, QGVAR(fullRepairLocation), "fullRepairLocation"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(engineerSetting_fullRepair), "engineerSetting_fullRepair"] call EFUNC(common,readSettingFromModule);

[_logic, QGVAR(addSpareParts), "addSpareParts"] call EFUNC(common,readSettingFromModule);

[_logic, QGVAR(wheelRepairRequiredItems), "wheelRepairRequiredItems"] call EFUNC(common,readSettingFromModule);

INFO("Repair Module Initialized.");
