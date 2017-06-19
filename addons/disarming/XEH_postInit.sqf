#include "script_component.hpp"

[QGVAR(dropItems), FUNC(eventTargetStart)] call CBA_fnc_addEventHandler;
[QGVAR(debugCallback), FUNC(eventCallerFinish)] call CBA_fnc_addEventHandler;
