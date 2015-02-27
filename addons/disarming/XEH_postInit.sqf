#include "script_component.hpp"

["Disarm", {_this call FUNC(startDisarmTarget)}] call EFUNC(common,addEventHandler);
["DisarmFinished", {_this call FUNC(eventCallerFinish)}] call EFUNC(common,addEventHandler);
