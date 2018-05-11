/*
	File Name: fnc_refill.sqf
	Author: Jak Keen
*/

#include "../script_component.hpp"

private ["_item", "_player", "_mode"];

_player = _this select 1;
_mode = _this select 2;

switch (_mode) do {
	case "bottle": {
		{
			if (_x in (items player)) exitwith {
				if(count (nearestObjects [player, GVAR(refill_sources), 2]) > 0) then {
					_item = GET_CFG_VAR("CfgWeapons", _x, "ace_onFill");
					player removeItem _x;
					player addItem _item;
				};
			};
		} forEach GVAR(refill_items);
	};

	case "camelbak": {
		{
			if (_x in (items player)) exitwith {
				if(GVAR(camelbak_item) in (items player)) then {
					_item = GET_CFG_VAR("CfgWeapons", _x, "ace_onDrink");
					player removeItem _x;
					player addItem _item;

					GVAR(camelbak) = GVAR(camelbak) + 25;

					if(GVAR(camelbak) > 100) then {
						GVAR(camelbak) = 100;
					};
				};
			};
		} forEach GVAR(drink_items);
	};

	default {
		hint "Error no refill mode selected";
	};
};