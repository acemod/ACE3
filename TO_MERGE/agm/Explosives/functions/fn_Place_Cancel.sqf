/*
	Name: AGM_Explosives_fnc_Place_Cancel
	
	Author(s):
		Garth de Wet (LH)
	
	Description:
		Cancels placement of the explosive
	
	Parameters:
		Nothing
	
	Returns:
		Nothing
	
	Example:
		call AGM_Explosives_fnc_Place_Cancel;
*/
if (AGM_Explosives_pfeh_running) then {
	["AGM_Explosives_Placement","OnEachFrame"] call BIS_fnc_removeStackedEventHandler;
	AGM_Explosives_pfeh_running = false;
};
if (!isNull (AGM_Explosives_Setup)) then {
	deleteVehicle AGM_Explosives_Setup;
};
AGM_Explosives_Setup = objNull;
if (isNil {AGM_Explosives_placer}) then {
	AGM_Explosives_placer = objNull;
};
[AGM_Explosives_placer, "AGM_Explosives", false] call AGM_Core_fnc_setForceWalkStatus;
AGM_Explosives_placer = objNull;
call AGM_Interaction_fnc_hideMouseHint;
[AGM_player, "DefaultAction", AGM_player getVariable ["AGM_Explosive_Place",  -1]] call AGM_Core_fnc_removeActionEventHandler;
[AGM_player, "MenuBack",      AGM_player getVariable ["AGM_Explosive_Cancel", -1]] call AGM_Core_fnc_removeActionEventHandler;