#include "script_component.hpp"

private ["_loadedItems", "_actions", "_item", "_displayName", "_picture", "_action"];
PARAMS_2(_target,_player);

_actions = [];

_loadedItems = _target getVariable ["ACE_Cargo_loadedItems", []];

{
    _displayName = getText(configFile >> "CfgVehicles" >> typeOf(_x) >> "displayName");
    _picture = getText(configFile >> "CfgVehicles" >> typeOf(_x) >> "picture");
	_action = [_x, _displayName, _picture, {_this call FUNC(unloadItem)}, {true}, {},[_x]] call EFUNC(interact_menu,createAction);
    _actions pushBack [_action, [], _target];
} forEach _loadedItems;

_actions