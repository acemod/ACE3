/*
	File Name: fnc_hasCamelbak.sqf
	Author: Jak Keen
*/

#include "script_component.hpp"

if(GVAR(camelbak_item) in (items player)) exitwith {
	true;
};

false;