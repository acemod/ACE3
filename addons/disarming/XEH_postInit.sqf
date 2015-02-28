#include "script_component.hpp"

["DisarmDropItems", {_this call FUNC(eventTargetStart)}] call EFUNC(common,addEventHandler);
["DisarmDebugCallback", {_this call FUNC(eventCallerFinish)}] call EFUNC(common,addEventHandler);
