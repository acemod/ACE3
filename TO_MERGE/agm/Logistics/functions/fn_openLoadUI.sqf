/*
	Name: AGM_Logistics_fnc_openLoadUI
	
	Author: Garth de Wet (LH)
	
	Description:
		Opens the UI for load position selection
	
	Parameters:
		
	
	Returns:
		Nothing
	
	Example:
		[AGM_Interaction_Target, AGM_Logistics_targetVehicle] call AGM_Logistics_fnc_openLoadUI;
*/
private ["_vehicle","_result", "_item", "_index"];
_item = _this select 0;
_vehicle = _this select 1;

AGM_Interaction_Target = _item;
AGM_Logistics_targetVehicle = _vehicle;

if (isClass (configFile >> "CfgVehicles" >> typeOf(_vehicle) >> "AGM_Load")) exitWith {
	_size = getNumber(ConfigFile >> "CfgVehicles" >> Typeof(_item) >> "AGM_Size");
	_attachPoints = _vehicle call AGM_Logistics_fnc_getLoadPoints;
	
	_actions = [localize "STR_AGM_Logistics_LoadMenu", localize "STR_AGM_Logistics_LoadItem"] call AGM_Interaction_fnc_prepareSelectMenu;
	{
		if ([_x select 1, _x select 3] call AGM_Logistics_fnc_remainingSpace >= _size) then {
			_actions = [
				_actions,
				getText (ConfigFile >> "CfgVehicles" >> typeOf(_vehicle) >> "AGM_Load" >> _x select 4 >> "DisplayName"),
				getText (ConfigFile >> "CfgVehicles" >> typeOf(_vehicle) >> "picture"),
				_x select 4
			] call AGM_Interaction_fnc_AddSelectableItem;
		};
	} count _attachPoints;

	[
		_actions,
		{
			call AGM_Interaction_fnc_hideMenu;
			[AGM_Interaction_Target, AGM_Logistics_targetVehicle, _this] call AGM_Logistics_fnc_loadItem;
		},
		{
			call AGM_Interaction_fnc_hideMenu;
			if !(profileNamespace getVariable ["AGM_Interaction_AutoCloseMenu", false]) then {"Default" call AGM_Interaction_fnc_openMenu};
		}
	] call AGM_Interaction_fnc_openSelectMenu;
};
call AGM_Interaction_fnc_hideMenu;
[AGM_Interaction_Target, AGM_Logistics_targetVehicle, ""] call AGM_Logistics_fnc_loadItem;
