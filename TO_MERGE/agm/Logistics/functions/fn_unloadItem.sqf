/*
	Name: AGM_Logistics_fnc_loadItem
	
	Author: 
		commy2
		Garth de Wet (LH)
	
	Description:
		
	
	Parameters: 
		0: OBJECT - Item to load
		1: OBJECT - Vehicle to load into
		2: ARRAY
			0: String of variable name
			1: index within variable
	
	Returns:
		NOTHING
	
	Example:
		[AGM_Interaction_Target, AGM_Logistics_targetVehicle, ["AGM_Load_MidLoad", 1]] spawn AGM_Logistics_fnc_loadItem;
*/
_vehicle = _this select 0;
_variableName = (_this select 1) select 0;
_varIndex = (_this select 1) select 1;
_item = (_vehicle getVariable _variableName) select _varIndex;

_size = getNumber(ConfigFile >> "CfgVehicles" >> Typeof(_item) >> "AGM_Size");

if (!isNull(_item)) then {
	[_size * 5, [_vehicle, _item, _variableName], "AGM_Logistics_fnc_unloadItemCallback", localize "STR_AGM_Logistics_UnloadingItem"] call AGM_Core_fnc_progressBar;
	[_vehicle] call AGM_Core_fnc_closeDialogIfTargetMoves;
};
