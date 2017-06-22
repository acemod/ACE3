#include "script_component.hpp"

if (!hasInterface) exitWith {};

//If attach placing, stop when opening menu:
["ace_interactMenuOpened", {GVAR(placeAction) = 0;}] call CBA_fnc_addEventHandler;
