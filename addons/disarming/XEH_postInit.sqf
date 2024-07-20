#include "script_component.hpp"

[QGVAR(dropItems), LINKFUNC(eventTargetStart)] call CBA_fnc_addEventHandler;
[QGVAR(debugCallback), LINKFUNC(eventCallerFinish)] call CBA_fnc_addEventHandler;
