/*
	Name: ACE_Explosives_fnc_openPlaceUI

	Author: Garth de Wet (LH)

	Description:
		Opens the UI for explosive placement selection

	Parameters:
		0: OBJECT - unit

	Returns:
		Nothing

	Example:
		[player] call ACE_Explosives_fnc_openPlaceUI;
*/
#include "script_component.hpp"
private ["_unit","_mags", "_item", "_index", "_actions"];
_unit = _this select 0;
call FUNC(place_Cancel);

_mags = magazines _unit;
_list = [];
_itemCount = [];
{
	_item = ConfigFile >> "CfgMagazines" >> _x;
	if (getNumber(_item >> "ACE_Placeable") == 1) then {
		_index = _list find _item;
		if (_index != -1) then {
			_itemCount set [_index, (_itemCount select _index) + 1];
		} else {
			_list pushBack _item;
			_itemCount pushBack 1;
		};
	};
} forEach _mags;
_actions = [localize "STR_ACE_Explosives_PlaceMenu", localize "STR_ACE_Explosives_Place"]
	call EFUNC(Interaction,prepareSelectMenu);
{
	_actions = [
		_actions,
		format [getText(_x >> "displayName") + " (%1)", _itemCount select _foreachIndex],
		getText(_x >> "picture"),
		configName _x
	] call EFUNC(Interaction,AddSelectableItem);
} foreach _list;

[
	_actions,
	{
		[_this] call FUNC(openTriggerSelectionUI);
	},
	{
		call EFUNC(Interaction,hideMenu);
		if !(profileNamespace getVariable ["ACE_Interaction_AutoCloseMenu", false]) then {
			"ACE_Explosives" call EFUNC(Interaction,openMenuSelf);
		};
	}
] call EFUNC(Interaction,openSelectMenu);
