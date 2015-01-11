// by commy2

private ["_unit", "_crate", "_types", "_count", "_actions", "_name", "_picture", "_type"];

_unit = _this select 0;
_crate = _this select 1;
_types = _this select 2;

_count = count _types;

_actions = ["Select Fortification Menu", "Select"] call AGM_Interaction_fnc_prepareSelectMenu;
for "_index" from 0 to (_count - 1) do {
	_type = _types select _index;
	
	_name = getText (configFile >> "CfgVehicles" >> _type >> "displayName");
	_picture = "AGM_Interaction\UI\dot_ca.paa";

	_actions = [
		_actions,
		_name,
		_picture,
		_type
	] call AGM_Interaction_fnc_AddSelectableItem;
};

[
	_actions,
	{
		call AGM_Interaction_fnc_hideMenu;
		_vehicle = AGM_Interaction_Target;
		if ([player, _vehicle, _this] call AGM_Fortifications_fnc_canSetupBarrier) then {
			[player, _vehicle, _this] call AGM_Fortifications_fnc_setupBarrier;
		};
	},
	{
		call AGM_Interaction_fnc_hideMenu;
		if !(profileNamespace getVariable ["AGM_Interaction_AutoCloseMenu", false]) then {"Default" call AGM_Interaction_fnc_openMenu};
	}
] call AGM_Interaction_fnc_openSelectMenu;
