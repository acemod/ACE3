#include "script_component.hpp"

["backpackOpened", {_this call FUNC(backpackOpened)}] call EFUNC(common,addEventHandler);
["playerVehicleChanged", {_this call FUNC(playerVehicleChanged)}] call EFUNC(common,addEventHandler);