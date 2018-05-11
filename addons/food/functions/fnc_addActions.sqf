/*
	File Name: fnc_addActions.sqf
	Author: Jak Keen
*/

#include "../script_component.hpp"

private ["_condition", "_children", "_action"];

_condition = {
	private ["_con"];
	_con = false;

	{
		if (_x in (items player)) exitwith {
			_con = true;
		};
	} forEach GVAR(food_items) + GVAR(drink_items) + GVAR(refill_items);

	_con;
};

_children = {
	private ["_target", "_player", "_params", "_actions", "_action", "_condition", "_conDrink", "_conEat", "_conRefill", "_conCamelRefill"];
	params ["_target", "_player", "_params"];

	_actions = [];

	_conDrink = {
		private ["_con"];
		_con = false;

		{
			if (_x in (items player)) exitwith {
				_con = true;
			};
		} forEach GVAR(drink_items);

		_con;
	};

	_conEat = {
		private ["_con"];
		_con = false;

		{
			if (_x in (items player)) exitwith {
				_con = true;
			};
		} forEach GVAR(food_items);

		_con;
	};

	_conRefill = {
		private ["_con", "_sources"];
		_con = false;

		{
			if (_x in (items player)) exitwith {
				if(count (nearestObjects [player, GVAR(refill_sources), 2]) > 0) then {
					_con = true;
				};
			};
		} forEach GVAR(refill_items);

		_con;
	};

	_conCamelRefill = {
		private ["_con", "_sources", "_items"];
		_con = false;
		_items = (items player);

		{
			if (_x in _items) exitwith {
				if(GVAR(camelbak_item) in _items) then {
					_con = true;
				};
			};
		} forEach GVAR(drink_items);

		_con;
	};

	_action = ["drink", "Drink Water", QPATHTOF(data\gui\water.paa), {call FUNC(consume)}, _conDrink, {}, "drink"] call EFUNC(interact_menu,createAction);
	_actions pushBack [_action, [], _player];

	_action = ["eat", "Eat MRE", QPATHTOF(data\gui\food.paa), {call FUNC(consume)}, _conEat, {}, "eat"] call EFUNC(interact_menu,createAction);
	_actions pushBack [_action, [], _player];

	_action = ["refill", "Refill Bottle", QPATHTOF(data\gui\water.paa), {call FUNC(refill)}, _conRefill, {}, "bottle"] call EFUNC(interact_menu,createAction);
	_actions pushBack [_action, [], _player];

	_action = ["refillCamel", "Refill Camelbak", QPATHTOF(data\gui\camelbak.paa), {call FUNC(refill)}, _conCamelRefill, {}, "camelbak"] call EFUNC(interact_menu,createAction);
	_actions pushBack [_action, [], _player];

	_actions;
};

_action = ["food", "Food and Drink", QPATHTOF(data\gui\food.paa), {}, _condition, _children] call EFUNC(interact_menu,createAction);
[player, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToObject);