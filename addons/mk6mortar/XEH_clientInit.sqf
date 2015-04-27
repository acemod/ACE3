#include "script_component.hpp"

if (!hasInterface) exitWith {};

["playerVehicleChanged", {_this call FUNC(handlePlayerVehicleChanged);}] call EFUNC(common,addEventHandler);
