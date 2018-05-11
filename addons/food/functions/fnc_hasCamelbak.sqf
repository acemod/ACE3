/*
	File Name: fnc_hasCamelbak.sqf
	Author: Jak Keen
*/

#include "../script_component.hpp"

private ["_item", "_return"];

_item = "";
_return = false;

if(GVAR(camelbak_item) in (items player)) exitwith {
	_item = _x;
};

if(!(_item == "")) then {
	_return = true;
};

_return;