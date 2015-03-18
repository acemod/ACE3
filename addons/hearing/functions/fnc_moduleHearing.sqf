/*
 * Author: CAA-Picard
 * Initializes the Map module.
 *
 * Arguments:
 * Whatever the module provides. (I dunno.)
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

_logic = _this select 0;
_activated = _this select 2;

if !(_activated) exitWith {};

[_logic, QGVAR(enableCombatDeafness), "EnableCombatDeafness"] call EFUNC(common,readSettingFromModule);

diag_log text "[ACE]: Interaction Module Initialized.";
