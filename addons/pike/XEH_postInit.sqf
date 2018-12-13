#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ace_firedPlayer", LINKFUNC(handleFired)] call CBA_fnc_addEventHandler;
