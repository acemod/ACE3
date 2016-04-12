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

if (!isServer) exitWith {};

[_logic, QGVAR(engineerSetting_Repair), "engineerSetting_Repair"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(engineerSetting_Wheel), "engineerSetting_Wheel"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(consumeItem_ToolKit), "consumeItem_ToolKit"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(repairDamageThreshold), "repairDamageThreshold"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(repairDamageThreshold_Engineer), "repairDamageThreshold_Engineer"] call CFUNC(readSettingFromModule);


[_logic, QGVAR(fullRepairLocation), "fullRepairLocation"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(engineerSetting_fullRepair), "engineerSetting_fullRepair"] call CFUNC(readSettingFromModule);

[_logic, QGVAR(addSpareParts), "addSpareParts"] call CFUNC(readSettingFromModule);

[_logic, QGVAR(wheelRepairRequiredItems), "wheelRepairRequiredItems"] call CFUNC(readSettingFromModule);

ACE_LOGINFO("Repair Module Initialized.");
