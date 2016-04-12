/*
 * Author: esteldunedain
 * Initializes the Hearing module.
 *
 * Arguments:
 * Whatever the module provides. (I dunno.)
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

params ["_logic"];

[_logic, QGVAR(EnableCombatDeafness), "EnableCombatDeafness"] call CFUNC(readSettingFromModule);

// Do Not Force - read module setting only non-default is set due to using SCALAR
if ((_logic getVariable "DisableEarRinging") != -1) then {
    [_logic, QGVAR(DisableEarRinging), "DisableEarRinging"] call CFUNC(readSettingFromModule);
};
[_logic, QGVAR(enabledForZeusUnits), "enabledForZeusUnits"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(autoAddEarplugsToUnits), "autoAddEarplugsToUnits"] call CFUNC(readSettingFromModule);
ACE_LOGINFO("Hearing Module Initialized.");
