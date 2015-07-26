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

diag_log text "[ACE]: Hearing Module Initialized.";
