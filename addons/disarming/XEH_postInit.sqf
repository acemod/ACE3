#include "script_component.hpp"

["ace_disarmDropItems", FUNC(eventTargetStart)] call CBA_fnc_addEventHandler;
["ace_disarmDebugCallback", FUNC(eventCallerFinish)] call CBA_fnc_addEventHandler;
