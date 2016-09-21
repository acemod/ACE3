#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ace_firedPlayer", FUNC(handleFired)] call CBA_fnc_addEventHandler;
