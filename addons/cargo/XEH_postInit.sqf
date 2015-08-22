#include "script_component.hpp"

["LoadCargo", {_this call FUNC(loadItem)}] call EFUNC(common,addEventHandler);
["UnloadCargo", {_this call FUNC(unloadItem)}] call EFUNC(common,addEventHandler);
["AddCargoByClass", {_this call FUNC(addCargoItem)}] call EFUNC(common,addEventHandler);
