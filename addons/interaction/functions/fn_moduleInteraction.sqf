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

_logic = _this select 0;
_activated = _this select 2;

if !(_activated) exitWith {};

[_logic, "AGM_Interaction_EnableTeamManagement", "EnableTeamManagement"] call AGM_Core_fnc_readBooleanParameterFromModule;

diag_log text "[AGM]: Interaction Module Initialized.";
