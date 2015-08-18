#include "script_component.hpp"

["LoadItem", {_this call FUNC(loadItem)}] call EFUNC(common,addEventHandler);
["UnloadItem", {_this call FUNC(unloadItem)}] call EFUNC(common,addEventHandler);
