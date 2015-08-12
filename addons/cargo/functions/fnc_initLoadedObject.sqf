// by commy2

#include "script_component.hpp"

private ["_vehicle", "_item", "_loadedItems"];

_vehicle = _this select 0;
_item = _this select 1;

_loadedItems = _vehicle getVariable ["ACE_Cargo_loadedItems", []];
_loadedItems pushBack _item;

_item attachTo [ACE_Cargo_loadedItemsDummy, [0, 0, 0], ""];

_vehicle setVariable ["ACE_Cargo_loadedItems", _loadedItems, true];