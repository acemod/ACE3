// by Garth de Wet (LH), edited by commy2

if (AGM_Fortifications_pfeh_running) then {
	["AGM_Fortifications_Placement", "OnEachFrame"] call BIS_fnc_removeStackedEventHandler;
	AGM_Fortifications_pfeh_running = false;
};

if (!isNull (AGM_Fortifications_Setup)) then {
	deleteVehicle AGM_Fortifications_Setup;
};

[objNull, AGM_Fortifications_crate] call AGM_Core_fnc_claim;

AGM_Fortifications_Setup = objNull;

if (isNil {AGM_Fortifications_placer}) then {
	AGM_Fortifications_placer = objNull;
};

[AGM_Fortifications_placer, "AGM_Logistics", false] call AGM_Core_fnc_setForceWalkStatus;
AGM_Fortifications_placer = objNull;
call AGM_Interaction_fnc_hideMouseHint;

[player, "DefaultAction", player getVariable ["AGM_Fortifications_Place", -1]] call AGM_Core_fnc_removeActionEventHandler;
[player, "MenuBack", player getVariable ["AGM_Fortifications_Cancel", -1]] call AGM_Core_fnc_removeActionEventHandler;
