/*
 * Author: CAA-Picard
 *
 * Initializes the name tags module.
 *
 * Arguments:
 * Whatever the module provides.
 *
 * Return Value:
 * None
 */

if !(isServer) exitWith {};

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {};

AGM_NameTags_Module = true;

[_logic, "AGM_NameTags_PlayerNamesViewDistance",  "PlayerNamesViewDistance"     ] call AGM_Core_fnc_readNumericParameterFromModule;
[_logic, "AGM_NameTags_ShowNamesForAI",           "ShowNamesForAI"              ] call AGM_Core_fnc_readBooleanParameterFromModule;
[_logic, "AGM_NameTags_CrewInfoVisibility",       "Visibility"                  ] call AGM_Core_fnc_readNumericParameterFromModule;

diag_log text "[AGM]: NameTags Module Initialized.";
