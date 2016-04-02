#include "script_component.hpp"

["DisarmDropItems", FUNC(eventTargetStart)] call CFUNC(addEventHandler);
["DisarmDebugCallback", FUNC(eventCallerFinish)] call CFUNC(addEventHandler);
