#include "script_component.hpp"

if (!hasInterface) exitWith {};

#include "initKeybinds.inc.sqf"

GVAR(active) = false;
GVAR(initialised) = false;

[QEGVAR(vector,rangefinderData), {_this call FUNC(sord)}] call CBA_fnc_addEventHandler;
