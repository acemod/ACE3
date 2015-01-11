// by commy2

private ["_vehicle", "_wheels", "_listIDC", "_count", "_index", "_wheel", "_name", "_picture", "_lbIndex"];

_vehicle = _this select 0;
//_wheels = _this select 1;

_wheels = getArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_Wheels");

_wheels = [_wheels, {AGM_Interaction_Target getHitPointDamage _this < 1}] call AGM_Core_fnc_filter;
_count = count _wheels;

_actions = [localize "STR_AGM_Repair_SelectWheelMenu_Salvage", localize "STR_AGM_Repair_SelectWheel_Salvage"] call AGM_Interaction_fnc_prepareSelectMenu;
for "_index" from 0 to (_count - 1) do {
	_wheel = _wheels select _index;
	//_name = [_wheel] call AGM_Repair_fnc_getHitPointName;
	_name = localize (getArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_WheelsLocalized") select (getArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_Wheels") find _wheel));
	_picture = "AGM_Interaction\UI\dot_ca.paa";

	if (_vehicle getHitPointDamage _wheel < 1) then {
		_actions = [
			_actions,
			_name,
			_picture,
			_wheel
		] call AGM_Interaction_fnc_AddSelectableItem;
	};
};

[
	_actions,
	{
		call AGM_Interaction_fnc_hideMenu;
		_vehicle = AGM_Interaction_Target;
		[_vehicle, _this] call AGM_Repair_fnc_removeWheel;
	},
	{
		call AGM_Interaction_fnc_hideMenu;
		if !(profileNamespace getVariable ["AGM_Interaction_AutoCloseMenu", false]) then {"Default" call AGM_Interaction_fnc_openMenu};
	}
] call AGM_Interaction_fnc_openSelectMenu;
