// by commy2
_vehicle = _this select 0;
_item = _this select 1;
_itemHolder = _this select 2;

_loadedItems = _vehicle getVariable [_itemHolder, []];

// exit here if the item was unloaded by someone else
if !(_item in _loadedItems) exitWith {};

_loadedItems = _loadedItems - [_item];
_vehicle setVariable [_itemHolder, _loadedItems, true];

player allowDamage false;
detach _item;
_item enableSimulationGlobal true;
_item hideObjectGlobal false;
[_item, "{{_x reveal _this} forEach allUnits}", 2] call AGM_Core_fnc_execRemoteFnc;

_position = getPos player findEmptyPosition [0, 4, typeOf _item];
if (count _position == 0) then {_position = getPosASL player};
_position set [2, (getPosASL player) select 2];

_item setPosASL _position;
[_item, "{_this setVectorUp (surfaceNormal getPosASL _this)}", _item] call AGM_Core_fnc_execRemoteFnc;

player reveal _item;
player allowDamage true;

_itemName = getText (configFile >> "CfgVehicles" >> typeOf _item >> "displayName");
_vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
[format [localize "STR_AGM_Logistics_UnloadedItem", _itemName, _vehicleName]] call AGM_Core_fnc_displayTextStructured;
