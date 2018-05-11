/*
	File Name: fnc_consume.sqf
	Author: Jak Keen
*/

#include "../script_component.hpp"

private ["_player", "_mode"];

_player = _this select 1;
_mode = _this select 2;

switch (_mode) do {
    case "eat": {
        private ["_mre"];

        _mre == "";

        {
            if(_x in (items player)) exitwith {
                _mre = _x;
            };
        } forEach GVAR(food_items);

        if(!(_mre == "")) then {
            player say3D "eating";
            _player removeItem _mre;

            GVAR(food) = GVAR(food) + 50;
            if(GVAR(food) > 100) then {
                GVAR(food) = 100;
            };
        } else {
            hint "You need to have food on you before you can eat";
        };
    };

    case "drink": {
        private ["_drink"];

        _drink == "";

        {
            if(_x in (items _player)) exitwith {
                _drink = _x;
            };
        } forEach GVAR(drink_items);

        if(_drink == "") exitWith {
            hint "You need to have a drink on you before you can drink";
        };

        player say3D "drinking";
        _player removeItem _drink;
        _item = GET_CFG_VAR("CfgWeapons", _drink, "ace_onDrink");
        _player addItem _item;

        GVAR(water) = GVAR(water) + 40;
        if(GVAR(water) > 100) then {
            GVAR(water) = 100;
        };
    };

    default {
        hint "Error no consume mode selected";
    };
};