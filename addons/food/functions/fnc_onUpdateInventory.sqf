/*
	File Name: fnc_onUpdateInventory.sqf
	Author: Jak Keen
*/

#include "script_component.hpp"

_result = [] call FUNC(hasCamelbak);

if(!(_result)) then {
    GVAR(camelbak) = 0;
};