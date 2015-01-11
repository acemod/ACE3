/*
	Name: AGM_Logistics_fnc_loadItem
	
	Author: 
		commy2
		Garth de Wet (LH)
	
	Description:
		
	
	Parameters: 
		0: OBJECT - Item to load
		1: OBJECT - Vehicle to load into
		2: STRING - Load point class
	
	Returns:
		NOTHING
	
	Example:
		[AGM_Interaction_Target, AGM_Logistics_targetVehicle, "MidLoad"] call AGM_Logistics_fnc_loadItem;
*/
_item = _this select 0;
_vehicle = _this select 1;

_item setVariable ["AGM_isUsedBy", player, true];

_size = getNumber(ConfigFile >> "CfgVehicles" >> Typeof(_item) >> "AGM_Size");
if (isClass (configFile >> "CfgVehicles" >> typeOf(_vehicle) >> "AGM_Load")) exitWith {
	_attachPoints = _vehicle call AGM_Logistics_fnc_getLoadPoints;
	{
		if ((_x select 4) == (_this select 2)) exitWith {
			if ([_x select 1, _x select 3] call AGM_Logistics_fnc_remainingSpace >= _size) then {
				[5 * _size, [_item, _vehicle, _x select 4, false], "AGM_Logistics_fnc_loadItemCallback", localize "STR_AGM_Logistics_LoadingItem", "AGM_Logistics_fnc_loadItemAbort"] call AGM_Core_fnc_progressBar;
			};
		};
	} count _attachPoints;
};
// Fallback to magic menu
[5 * _size, [_item, _vehicle, "", true], "AGM_Logistics_fnc_loadItemCallback", localize "STR_AGM_Logistics_LoadingItem", "AGM_Logistics_fnc_loadItemAbort"] call AGM_Core_fnc_progressBar;
[_vehicle] call AGM_Core_fnc_closeDialogIfTargetMoves;
