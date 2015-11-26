/*
 * Author: PabstMirror
 * Function for the module
 *
 * Arguments:
 * 0: logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [module] call ace_fatigue_fnc_module
 *
 * Public: No
 */
#include "script_component.hpp"

if !(isServer) exitWith {};

params ["_logic"];

[_logic, QGVAR(enabled), "enabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(staminaDrainMultiplier), "staminaDrainMultiplier"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(staminaRecoveryMultiplier), "staminaRecoveryMultiplier"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(loadEffectOnMaxStamina), "loadEffectOnMaxStamina"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(canNoLongerSprint), "canNoLongerSprint"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(canNoLongerRun), "canNoLongerRun"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(runCooldownAfterExhaustion), "runCooldownAfterExhaustion"] call EFUNC(common,readSettingFromModule);

ACE_LOGINFO("Module Loaded");
