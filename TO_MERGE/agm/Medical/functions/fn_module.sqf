/*
 * Author: KoffeinFlummi
 *
 * Initializes the medical module.
 *
 * Arguments:
 * Whatever the module provides. (I dunno.)
 *
 * Return Value:
 * None
 */

private ["_logic", "_units", "_activated"];

if !(isServer) exitWith {};

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {};

AGM_Medical_Module = True;

AGM_Medical_MEDEVACTriggers = [synchronizedObjects _logic, {triggerType _this != ""}] call AGM_Core_fnc_filter;
publicVariable "AGM_Medical_MEDEVACTriggers";
AGM_Medical_MEDEVACVehicles = _units;
publicVariable "AGM_Medical_MEDEVACVehicles";

[_logic, "AGM_Medical_CoefDamage",                   "CoefDamage"                  ] call AGM_Core_fnc_readNumericParameterFromModule;
[_logic, "AGM_Medical_CoefBleeding",                 "CoefBleeding"                ] call AGM_Core_fnc_readNumericParameterFromModule;
[_logic, "AGM_Medical_CoefPain",                     "CoefPain"                    ] call AGM_Core_fnc_readNumericParameterFromModule;
[_logic, "AGM_Medical_CoefNonMedic",                 "CoefNonMedic"                ] call AGM_Core_fnc_readNumericParameterFromModule;
[_logic, "AGM_Medical_MaxUnconsciousnessTime",       "MaxUnconsciousnessTime"      ] call AGM_Core_fnc_readNumericParameterFromModule;

[_logic, "AGM_Medical_AllowNonMedics",               "AllowNonMedics"              ] call AGM_Core_fnc_readBooleanParameterFromModule;
[_logic, "AGM_Medical_RequireDiagnosis",             "RequireDiagnosis"            ] call AGM_Core_fnc_readBooleanParameterFromModule;
[_logic, "AGM_Medical_PreventInstaDeath",            "PreventInstaDeath"           ] call AGM_Core_fnc_readBooleanParameterFromModule;
[_logic, "AGM_Medical_PreventDeathWhileUnconscious", "PreventDeathWhileUnconscious"] call AGM_Core_fnc_readBooleanParameterFromModule;
[_logic, "AGM_Medical_SingleBandage",                "SingleBandage"               ] call AGM_Core_fnc_readBooleanParameterFromModule;
[_logic, "AGM_Medical_AllowChatWhileUnconscious",    "AllowChatWhileUnconscious"   ] call AGM_Core_fnc_readBooleanParameterFromModule;
[_logic, "AGM_Medical_EnableOverdosing",             "EnableOverdosing"            ] call AGM_Core_fnc_readBooleanParameterFromModule;
[_logic, "AGM_Medical_RequireMEDEVAC",               "RequireMEDEVAC"              ] call AGM_Core_fnc_readBooleanParameterFromModule;
[_logic, "AGM_Medical_AutomaticWakeup",              "AutomaticWakeup"             ] call AGM_Core_fnc_readBooleanParameterFromModule;
[_logic, "AGM_Medical_DisableScreams",               "DisableScreams"              ] call AGM_Core_fnc_readBooleanParameterFromModule;

diag_log text "[AGM]: Medical Module Initialized.";
