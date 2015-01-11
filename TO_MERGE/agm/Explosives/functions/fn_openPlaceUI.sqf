/*
	Name: AGM_Explosives_fnc_openPlaceUI
	
	Author: Garth de Wet (LH)
	
	Description:
		Opens the UI for explosive placement selection
	
	Parameters: 
		0: OBJECT - unit
	
	Returns:
		Nothing
	
	Example:
		[player] call AGM_Explosives_fnc_openPlaceUI;
*/
private ["_unit","_mags", "_item", "_index", "_actions"];
_unit = _this select 0;
call AGM_Explosives_fnc_Place_Cancel;

_mags = magazines _unit;
_list = [];
_itemCount = [];
{
	_item = ConfigFile >> "CfgMagazines" >> _x;
	if (getNumber(_item >> "AGM_Placeable") == 1) then {
		_index = _list find _item;
		if (_index != -1) then {
			_itemCount set [_index, (_itemCount select _index) + 1];
		} else {
			_list pushBack _item;
			_itemCount pushBack 1;
		};
	};
} forEach _mags;
_actions = [localize "STR_AGM_Explosives_PlaceMenu", localize "STR_AGM_Explosives_Place"] call AGM_Interaction_fnc_prepareSelectMenu;
{
	_actions = [
		_actions,
		format [getText(_x >> "displayName") + " (%1)", _itemCount select _foreachIndex],
		getText(_x >> "picture"),
		configName _x
	] call AGM_Interaction_fnc_AddSelectableItem;
} foreach _list;

[
	_actions,
	{
		[_this] call AGM_Explosives_fnc_openTriggerSelectionUI;
	},
	{
		call AGM_Interaction_fnc_hideMenu;
		if !(profileNamespace getVariable ["AGM_Interaction_AutoCloseMenu", false]) then {
			"AGM_Explosives" call AGM_Interaction_fnc_openMenuSelf;
		};
	}
] call AGM_Interaction_fnc_openSelectMenu;
