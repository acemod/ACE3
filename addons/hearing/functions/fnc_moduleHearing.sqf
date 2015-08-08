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

PARAMS_3(_logic,_units,_activated);

if !(_activated) exitWith {};

[_logic, QGVAR(enableCombatDeafness), "EnableCombatDeafness"] call EFUNC(common,readSettingFromModule);

// Do Not Force - read module setting only non-default is set due to using SCALAR
if ((_logic getVariable "DisableEarRinging") != -1) then {
    [_logic, QGVAR(DisableEarRinging), "DisableEarRinging"] call EFUNC(common,readSettingFromModule);
};

[_logic, QGVAR(enabledForZeusUnits), "enabledForZeusUnits"] call EFUNC(common,readSettingFromModule);

diag_log text "[ACE]: Hearing Module Initialized.";
