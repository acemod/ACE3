#include "script_component.hpp"

#include "initKeybinds.sqf"

GVAR(active) = false;
GVAR(initialised) = false;

[QEGVAR(vector,rangefinderData), LINKFUNC(sord)] call CBA_fnc_addEventHandler;
