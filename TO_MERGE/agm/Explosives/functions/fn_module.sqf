/*
	Name: AGM_Explosives_fnc_module

	Author: Garth de Wet (LH)

	Description:
		Initialises the explosives module

	Parameters:
		Things

	Returns:
		Nothing

	Example:

*/
if !(isServer) exitWith {};
_logic = _this select 0;
_activated = _this select 2;

if !(_activated) exitWith {};

[_logic, "AGM_Explosives_RequireSpecialist",         "RequireSpecialist"           ] call AGM_Core_fnc_readBooleanParameterFromModule;
[_logic, "AGM_Explosives_PunishNonSpecialists",      "PunishNonSpecialists"        ] call AGM_Core_fnc_readBooleanParameterFromModule;

diag_log text "[AGM]: Explosive Module Initialized.";
