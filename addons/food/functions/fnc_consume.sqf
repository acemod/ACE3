/*
	File Name: fnc_consume.sqf
	Author: Jak Keen
*/

#include "script_component.hpp"

params ["_target", "_player", "_mode"];

if(isNil "_mode") exitwith {};

switch (_mode) do {
    case 0: {
        private ["_mre"];

        _mre == "";

        {
            if(_x in (items player)) exitwith {
                _mre = _x;
            };
        } forEach GVAR(food_items);

        if(_mre != "") then {
            player say3D "ACE_Eating";
            _player removeItem _mre;

            GVAR(food) = GVAR(food) + 50;
            if(GVAR(food) > 100) then {
                GVAR(food) = 100;
            };

            GVAR(water) = GVAR(water) - 2;
        } else {
            hint "You need to have food on you before you can eat";
        };
    };

    case 1: {
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

        player say3D "ACE_Drinking";
        _player removeItem _drink;
        _item = getText (configFile >> "CfgWeapons" >> _drink >> QGVAR(onDrink));

        _player addItem _item;

        GVAR(water) = GVAR(water) + 40;
        if(GVAR(water) > 100) then {
            GVAR(water) = 100;
        };

        GVAR(food) = GVAR(food) - 2;
    };
};