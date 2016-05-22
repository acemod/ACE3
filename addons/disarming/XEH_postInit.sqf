#include "script_component.hpp"

["DisarmDropItems", FUNC(eventTargetStart)] call CBA_fnc_addEventHandler;
["DisarmDebugCallback", FUNC(eventCallerFinish)] call CBA_fnc_addEventHandler;
