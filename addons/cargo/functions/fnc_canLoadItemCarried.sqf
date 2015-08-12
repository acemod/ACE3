#include "script_component.hpp"

private ["_vehicle", "_item", "_result", "_size", "_attachPoints", "_loadedItems"];

_vehicle = _this;

if(!isNull(player getVariable ["ace_dragging_draggedObject", objNull])) then {
    _item = player getVariable ["ace_dragging_draggedObject", objNull];
} else {
    _item = player getVariable ["ace_dragging_carriedObject", objNull];
};

if (isNull _item) exitWith {false};

_result = false;
_size = getNumber(ConfigFile >> "CfgVehicles" >> typeOf(_item) >> "ACE_Size");
if (isClass (configFile >> "CfgVehicles" >> typeOf(_vehicle) >> "ACE_Load")) then {
	_attachPoints = [_vehicle] call FUNC(getLoadPoints);
	{
		if ([_x select 1, _x select 3] call FUNC(remainingSpace) >= _size) exitWith {
			_result = true;
		};
	} count _attachPoints;
} else {
	_loadedItems = _vehicle getVariable ["ACE_Cargo_loadedItems", []];
	if ([getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "ACE_Vehicle_Cargo"), _loadedItems] call FUNC(remainingSpace) >= _size) then {
		_result = true;
	};
};
_result