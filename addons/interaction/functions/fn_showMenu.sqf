/*
	Author:
		commy2
		Garth de Wet (LH)
		aeroson

	Description:

	Parameters:
		0: NUMBER - Menu type (0 - interaction, 1 - self-interaction, 2 - sub-interaction, 3 - sub-self-interaction)
		1: OBJECT - Target object
		2: STRING - Sub-Menu ClassName

	Returns:
		Nothing

	Example:
		[0, GVAR(Target)] call FUNC(showMenu);
		[1, player] call FUNC(showMenu);
		[2, GVAR(Target), "ACE_Explosives"] call FUNC(showMenu);
		[3, player, "ACE_Explosives"] call FUNC(showMenu);
*/
#include "script_component.hpp"

private ["_player", "_vehicle", "_mainButtonAction", "_object", "_index", "_actions", "_result", "_menuType"];
#define DEFAULT_ICON PATHOF(UI\dot_ca.paa)
#define DEFAULT_DISTANCE 4 // seems to be 4
_player = ACE_player;
_vehicle = vehicle _player;

GVAR(MenuType) = _this select 0;	// 0 Interaction, 1 Self Interaction

_mainButtonAction = [
	{call FUNC(hideMenu)},
	{call FUNC(hideMenu)},
	{"Default" call FUNC(openMenu)},
	{"Default" call FUNC(openMenuSelf)}
] select GVAR(MenuType);

_menuType = GVAR(MenuType) % 2;
uiNamespace setVariable [QGVAR(CursorPosition), [controlNull, 0.5, 0.5, -1]];

GVAR(Target) = _this select 1;
_object = GVAR(Target);

if (_menuType == 0 && {(isNull (_object) || {!([_object, 4] call FUNC(isInRange))})}) exitWith {};
if !([_player, _object] call EFUNC(core,canInteractWith)) exitWith {};

// add actions or self actions of GVAR(Target)
_parents = [configFile >> "CfgVehicles" >> typeOf _object, true] call BIS_fnc_returnParents;
_result = [_object, _parents, [], [], missionConfigFile >> "CfgVehicles", true, ["ACE_Actions", "ACE_SelfActions"] select _menuType, _this select 2] call FUNC(GetActions);
_actions = ([_object, _parents, _result select 0, _result select 1,configFile >> "CfgVehicles", false, ["ACE_Actions", "ACE_SelfActions"] select _menuType, _this select 2] call FUNC(GetActions) select 0);

// add self actions of vehicle _player
if (_menuType == 1 && {_player != _vehicle}) then {
	_parents = [configFile >> "CfgVehicles" >> typeOf _vehicle, true] call BIS_fnc_returnParents;
	_result = [_vehicle, _parents, [], [], missionConfigFile >> "CfgVehicles", true, ["ACE_Actions", "ACE_SelfActions"] select _menuType, _this select 2] call FUNC(GetActions);
	_actions = _actions + (([_vehicle, _parents, _result select 0, _result select 1,configFile >> "CfgVehicles", false, ["ACE_Actions", "ACE_SelfActions"] select _menuType, _this select 2] call FUNC(GetActions) select 0));
};

// custom defined actions, stored in variable instead of cfg like above
if (GVAR(MenuType) < 2) then {

	private ["_customActions", "_customAction", "_displayName", "_distance","_condition","_statement","_showDisabled", "_priority"];

	// add interactions or self interactions of GVAR(Target)
	_customActions = (_object getVariable [[QGVAR(Interactions), QGVAR(ACE_InteractionsSelf)] select _menuType, [-1, [], []]]) select 2;

	// add self interactions of vehicle _player
	if (_menuType == 1 && {_player != _vehicle}) then {
		_customActions = _customActions + ((_vehicle getVariable [[QGVAR(Interactions), QGVAR(ACE_InteractionsSelf)] select _menuType, [-1, [], []]]) select 2);
	};

	if(_menuType==0) then {

		private ["_distance"];

		for "_index" from 0 to (count _customActions - 1) do {

			_customAction = _customActions select _index;
			_displayName = _customAction select 0;
			_distance = _customAction select 1;
			_condition = _customAction select 2;
			_statement = _customAction select 3;
			_showDisabled = _customAction select 4;
			_priority = _customAction select 5;

			if ((_showDisabled || {[_object, _player] call _condition}) && {[_object, _distance] call FUNC(isInRange) || {_distance == 0}}) then {
				_actions pushBack [_displayName, _statement, _condition, _priority, [], DEFAULT_ICON, "", {true}, [], _distance, ""];
			};
		};

	} else { // self interactions do not have distance

		for "_index" from 0 to (count _customActions - 1) do {

			_customAction = _customActions select _index;
			_displayName = _customAction select 0;
			_condition = _customAction select 1;
			_statement = _customAction select 2;
			_showDisabled = _customAction select 3;
			_priority = _customAction select 4;

			if (_showDisabled || {[_object, _player] call _condition}) then {
				_actions pushBack [_displayName, _statement, _condition, _priority, [], DEFAULT_ICON, "", {true}, [], DEFAULT_DISTANCE, ""];
			};
		};

	};


};

if (count _actions == 0) exitWith {};

_actions call FUNC(sortOptionsByPriority);
GVAR(Buttons) = _actions;
[_mainButtonAction, (_this select 2) != "", (profileNamespace getVariable [QGVAR(FlowMenu), false]), _menuType == 1, _object] call FUNC(initialiseInteraction);
