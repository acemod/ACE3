#include "script_component.hpp"

if (!hasInterface) exitWith {};

["playerVehicleChanged", {_this call FUNC(handlePlayerVehicleChanged);}] call EFUNC(common,addEventHandler);
["infoDisplayChanged", {_this call FUNC(turretDisplayLoaded);}] call EFUNC(common,addEventHandler);
