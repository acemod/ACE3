#include "script_component.hpp"

_vehicle = _this select 0 select 0;
_unit = _this select 0 select 1;
_item = _this select 0 select 2;

hint format ["%1", _vehicle];

_loadedItems = _vehicle getVariable ["ACE_Cargo_loadedItems", []];

if !(_item in _loadedItems) exitWith {};

_loadedItems = _loadedItems - [_item];
_vehicle setVariable ["ACE_Cargo_loadedItems", _loadedItems];

detach _item;
_item enableSimulationGlobal true;
_item hideObjectGlobal false;
[_item, "{{_x reveal _this} forEach allUnits}", 2] call EFUNC(common,execRemoteFnc);

_position = getPos player findEmptyPosition [0, 4, typeOf _item];
if (count _position == 0) then {_position = getPosASL player};
_position set [2, (getPosASL player) select 2];

_item setPosASL _position;
[_item, "{_this setVectorUp (surfaceNormal getPosASL _this)}", _item] call EFUNC(common,execRemoteFnc);

player reveal _item;
player allowDamage true;

_itemName = getText (configFile >> "CfgVehicles" >> typeOf _item >> "displayName");
_vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
[format [localize "STR_ACE_Cargo_UnloadedItem", _itemName, _vehicleName]] call EFUNC(common,displayTextStructured);
