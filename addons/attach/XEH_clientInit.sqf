#include "script_component.hpp"

if (!hasInterface) exitWith {};

//If attach placing, stop when opening menu:
["interactMenuOpened", {GVAR(placeAction) = 0;}] call CFUNC(addEventHandler);
