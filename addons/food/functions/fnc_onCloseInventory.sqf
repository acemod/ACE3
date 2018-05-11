/*
	File Name: fnc_onCloseInventory.sqf
	Author: Jak Keen
*/

#include "../script_component.hpp"

private ["_camelbaks"];

if((items player) isEqualTo GVAR(inventory)) exitWith {};
GVAR(inventory) = (items player);

_result = [] call FUNC(hasCamelbak);

if(!(_result)) then {
    GVAR(camelbak) = 0;
};