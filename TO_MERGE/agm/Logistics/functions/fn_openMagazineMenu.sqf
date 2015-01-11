/*
	Name: AGM_Logistics_fnc_openMagazineMenu
	
	Author: Garth de Wet (LH)
	
	Description:
		Opens the UI for selecting magazines to load into vehicle.
	
	Parameters:
		0: OBJECT - vehicle
	
	Returns:
		Nothing
	
	Example:
		[AGM_Interaction_Target] call AGM_Logistics_fnc_openMagazineMenu;
*/
private ["_vehicle","_magazines"];
AGM_Logistics_targetVehicle = _this select 0;
_magazines = [player, AGM_Logistics_targetVehicle] call AGM_Logistics_fnc_getLoadableMagazines;

_listed = [];
_actions = [localize "STR_AGM_Logistics_MagazineMenu", localize "STR_AGM_Logistics_LoadItem"] call AGM_Interaction_fnc_prepareSelectMenu;
{
	if (!(_x in _listed) && {[AGM_Logistics_targetVehicle, _x] call AGM_Logistics_fnc_canLoadMagazine}) then {
		_class = ConfigFile >> "CfgMagazines" >> _x;
		_actions = [
			_actions,
			getText (_class >> "DisplayName"),
			getText (_class >> "picture"),
			_x
		] call AGM_Interaction_fnc_AddSelectableItem;
		_listed pushBack _x;
	};
} count _magazines;

[
	_actions,
	{
		call AGM_Interaction_fnc_hideMenu;
		[player, AGM_Logistics_targetVehicle, _this] call AGM_Logistics_fnc_loadMagazine;
	},
	{if !(profileNamespace getVariable ["AGM_Interaction_AutoCloseMenu", false]) then {"Default" call AGM_Interaction_fnc_openMenu};}
] call AGM_Interaction_fnc_openSelectMenu;
