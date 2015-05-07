#include "script_component.hpp"

private ["_vehicle","_result", "_item", "_index"];
_item = _this select 0;
_vehicle = _this select 1;

ACE_Interaction_Target = _item;
ACE_Cargo_targetVehicle = _vehicle;

if (isClass (configFile >> "CfgVehicles" >> typeOf(_vehicle) >> "ACE_Load")) exitWith {
	_size = getNumber(ConfigFile >> "CfgVehicles" >> typeOf(_item) >> "ACE_Size");
	_attachPoints = _vehicle call FUNC(getLoadPoints);
	
	_actions = [localize "STR_ACE_Cargo_LoadMenu", localize "STR_ACE_Cargo_LoadItem"] call EFUNC(interaction,prepareSelectMenu);
	{
		if ([_x select 1, _x select 3] call FUNC(remainingSpace) >= _size) then {
			_actions = [
				_actions,
				getText (ConfigFile >> "CfgVehicles" >> typeOf(_vehicle) >> "ACE_Load" >> _x select 4 >> "DisplayName"),
				getText (ConfigFile >> "CfgVehicles" >> typeOf(_vehicle) >> "picture"),
				_x select 4
			] call EFUNC(interaction,AddSelectableItem);
		};
	} count _attachPoints;

	[
		_actions,
		{
			call EFUNC(interaction,hideMenu);
			[ACE_Interaction_Target, ACE_Cargo_targetVehicle, _this] call FUNC(loadItem);
		},
		{
			call EFUNC(interaction,hideMenu);
			if !(profileNamespace getVariable ["ACE_Interaction_AutoCloseMenu", false]) then {"Default" call EFUNC(interaction,openMenu);};
		}
	] call EFUNC(interaction,openSelectMenu);
};
call EFUNC(interaction,hideMenu);
[ACE_Interaction_Target, ACE_Cargo_targetVehicle, ""] call FUNC(loadItem);