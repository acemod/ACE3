#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Initializes the Hearing module.
 *
 * Arguments:
 * 0: Logic <OBJECT>
 * 1: Synchronized Units (not used) <ARRAY>
 * 2: Module Activated (not used) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_hearing_fnc_moduleHearing
 *
 * Public: No
 */

params ["_logic"];

[_logic, QGVAR(EnableCombatDeafness), "EnableCombatDeafness"] call EFUNC(common,readSettingFromModule);

// Do Not Force - read module setting only non-default is set due to using SCALAR
if ((_logic getVariable "DisableEarRinging") != -1) then {
    [_logic, QGVAR(DisableEarRinging), "DisableEarRinging"] call EFUNC(common,readSettingFromModule);
};

[_logic, QGVAR(enabledForZeusUnits), "enabledForZeusUnits"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(autoAddEarplugsToUnits), "autoAddEarplugsToUnits"] call EFUNC(common,readSettingFromModule);

INFO("Hearing Module Initialized.");
