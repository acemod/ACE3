/*
 * Author: KoffeinFlummi
 * Edited from Medical Module
 * Editor: Hawkeye104
 *
 * Initializes the repair module.
 *
 * Arguments:
 * Whatever the module provides. (I dunno.)
 *
 * Return Value:
 * None 
 */
if !(isServer) exitWith {};

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {};

AGM_Repair_Module = true;

[_logic, "AGM_Repair_TimeRepair",                 "TimeRepair"                ] call AGM_Core_fnc_readNumericParameterFromModule;
[_logic, "AGM_Repair_TimeWheelRepair",                 "TimeWheelRepair"                ] call AGM_Core_fnc_readNumericParameterFromModule;
[_logic, "AGM_Repair_TimeTrackRepair",                 "TimeTrackRepair"                ] call AGM_Core_fnc_readNumericParameterFromModule;
[_logic, "AGM_Repair_MaxDamageRepair",                 "MaxDamageRepair"                ] call AGM_Core_fnc_readNumericParameterFromModule;


diag_log text "[AGM]: Repair Module Initialized.";