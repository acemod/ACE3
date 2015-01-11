// by commy2

private ["_vehicle", "_item", "_loadedItems"];

_vehicle = _this select 0;
_item = _this select 1;

_loadedItems = _vehicle getVariable ["AGM_Logistics_loadedItems", []];
_loadedItems pushBack _item;

_item attachTo [AGM_Logistics_loadedItemsDummy, [0, 0, 0], ""];

_vehicle setVariable ["AGM_Logistics_loadedItems", _loadedItems, true];
