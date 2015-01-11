// Original: Garth de Wet (LH), edited by commy2

private ["_vehicle", "_item", "_result", "_size", "_attachPoints", "_loadedItems"];

_vehicle = _this select 0;

_item = player getVariable ["AGM_carriedItem", objNull];
if (isNull _item) exitWith {false};

_result = false;
_size = getNumber(ConfigFile >> "CfgVehicles" >> Typeof(_item) >> "AGM_Size");
if (isClass (configFile >> "CfgVehicles" >> typeOf(_vehicle) >> "AGM_Load")) then {
	_attachPoints = _vehicle call AGM_Logistics_fnc_getLoadPoints;
	{
		if ([_x select 1, _x select 3] call AGM_Logistics_fnc_remainingSpace >= _size) exitWith {
			_result = true;
		};
	} count _attachPoints;
} else {
	_loadedItems = _vehicle getVariable ["AGM_Logistics_loadedItems", []];
	if ([getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_Vehicle_Cargo"), _loadedItems] call AGM_Logistics_fnc_remainingSpace >= _size) then {
		_result = true;
	};
};
_result
