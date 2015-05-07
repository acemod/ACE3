#include "script_component.hpp"

_item = _this select 0 select 0;
_vehicle = _this select 0 select 1;
_className = _this select 0 select 2;
_magicMenu = _this select 0 select 3;
_attachPoint = "";
_attachPos = [0,0,0];
_loaded = false;
_dummy = objNull;
hint "loading";
if (_item == player getVariable [QEGVAR(dragging,draggedObject), objNull]) then {
	[player, _item] call EFUNC(dragging,dropObject);
};

// add default items
_items = _vehicle getVariable "ACE_Cargo_loadedItems";
/*if (isNil "_items") then {
	switch (true) do {
		case (_vehicle isKindOf "Car_F") : {
			[_vehicle] call COMPILE_FILE(scripts\itemsCar));
		};
		case (_vehicle isKindOf "Tank_F") : {
			[_vehicle] call COMPILE_FILE(scripts\itemsTank);
		};
	};
};*/
hint format ["%1 : %2", [_item, _className]];
_size = getNumber(ConfigFile >> "CfgVehicles" >> typeOf(_item) >> "ACE_Size");
if (!_magicMenu) then {
	_attachPoints = _vehicle call FUNC(getLoadPoints);
	{
		if ((_x select 4) == _className) exitWith {
			if ([_x select 1, _x select 3] call FUNC(remainingSpace) >= _size) then {
				_loadedItems = _x select 3;
				_loadedItems pushBack _item;
				_vehicle setVariable [format ["ACE_Load_%1", _className], _loadedItems, true];
				_loaded = true;
				_attachPoint = _x select 0;
				_attachPos = _x select 1;
			};
		};
	} count _attachPoints;
} else {
	_loadedItems = _vehicle getVariable ["ACE_Cargo_loadedItems", []];
	if ([getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "ACE_Vehicle_Cargo"), _loadedItems] call FUNC(remainingSpace) >= _size) then {
		_loadedItems pushBack _item;
		_vehicle setVariable ["ACE_Cargo_loadedItems", _loadedItems, true];
		_loaded = true;
		_dummy = ACE_Cargo_loadedItemsDummy;
	};
};

if (_Loaded) then {
	//0 spawn ACE_Cargo_dropItem;
	_item attachTo [_dummy, _attachPos, _attachPoint];
	_item enableSimulationGlobal false;
	_item hideObjectGlobal true;

	_itemName = getText (configFile >> "CfgVehicles" >> typeOf _item >> "displayName");
	_vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

	[format [localize "STR_ACE_Cargo_LoadedItem", _itemName, _vehicleName]] call EFUNC(common,displayTextStructured);
};

_item setVariable [QGVAR(canInteract), objNull, true];