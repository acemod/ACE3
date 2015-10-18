#include "script_component.hpp"

["DisarmDropItems", FUNC(eventTargetStart)] call EFUNC(common,addEventHandler);
["DisarmDebugCallback", FUNC(eventCallerFinish)] call EFUNC(common,addEventHandler);
