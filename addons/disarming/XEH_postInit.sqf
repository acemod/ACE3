#include "script_component.hpp"

["DisarmStart", {_this call FUNC(startDisarmTarget)}] call EFUNC(common,addEventHandler);
["DisarmDebugCallback", {_this call FUNC(eventCallerFinish)}] call EFUNC(common,addEventHandler);
