/*
	Name: ACE_Explosives_fnc_module

	Author: Garth de Wet (LH)

	Description:
		Initialises the explosives module

	Parameters:
		Things

	Returns:
		Nothing

	Example:

*/
#include "script_component.hpp"
if !(isServer) exitWith {};
_logic = _this select 0;
_activated = _this select 2;

if !(_activated) exitWith {};

[_logic, QGVAR(RequireSpecialist),         "RequireSpecialist"           ] call EFUNC(Common,readSettingFromModule);
[_logic, QGVAR(PunishNonSpecialists),      "PunishNonSpecialists"        ] call EFUNC(Common,readSettingFromModule);

diag_log text "[ACE]: Explosive Module Initialized.";
