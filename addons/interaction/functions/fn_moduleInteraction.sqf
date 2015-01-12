/*
 * Author: bux578
 *
 * Initializes the Interaction module.
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

[_logic, QGVAR(EnableTeamManagement), "EnableTeamManagement"] call EFUNC(core,readBooleanParameterFromModule);

diag_log text "[ACE]: Interaction Module Initialized.";
