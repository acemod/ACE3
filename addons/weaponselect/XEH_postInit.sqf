// by esteldunedain
#include "script_component.hpp"

if (!hasInterface) exitWith {};

#include "initKeybinds.sqf"

// Register fire event handler
["ace_firedPlayer", DFUNC(throwGrenade)] call CBA_fnc_addEventHandler;
