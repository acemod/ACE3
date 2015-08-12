#include "script_component.hpp"

private ["_vehicle", "_index", "_listIDC"];
_vehicle = _this select 0;

ACE_Cargo_targetVehicle = _vehicle;
_actions = [ "STR_ACE_Cargo_UnloadMenu",  "STR_ACE_Cargo_UnloadItem"] call EFUNC(interaction,prepareSelectMenu);
if (isClass (configFile >> "CfgVehicles" >> typeOf(_vehicle) >> "ACE_Load")) then {
	_attachPoints = _vehicle call FUNC(getLoadPoints);
	{
		_class = _x select 4;
		{	
			_actions = [
				_actions,
				getText (ConfigFile >> "CfgVehicles" >> typeOf(_x) >> "displayName"),
				getText (ConfigFile >> "CfgVehicles" >> typeOf(_x) >> "picture"),
				["ACE_Load_" + _class, _foreachIndex]
			] call EFUNC(interaction,addSelectableItem);
		} forEach (_x select 3);
	} count _attachPoints;
};

_attachPoints = _vehicle getVariable ["ACE_Cargo_loadedItems", []];
{
	_actions = [
		_actions,
		getText (ConfigFile >> "CfgVehicles" >> typeOf(_x) >> "displayName"),
		getText (ConfigFile >> "CfgVehicles" >> typeOf(_x) >> "picture"),
		["ACE_Cargo_loadedItems", _foreachIndex]
	] call EFUNC(interaction,addSelectableItem);
} forEach _attachPoints;

[
	_actions,
	{
		call EFUNC(interaction,hideMenu);
		[ACE_Cargo_targetVehicle, _this] call FUNC(unloadItem);
	},
	{
		call EFUNC(interaction,hideMenu);
		if !(profileNamespace getVariable ["ACE_Interaction_AutoCloseMenu", false]) then {"Default" call EFUNC(interaction,openSelectMenu)};
	}
] call EFUNC(interaction,openSelectMenu);