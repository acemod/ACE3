#include "script_component.hpp"

PARAMS_1(_theVehicle);

_vehicleType = typeOf _theVehicle;

if (!(_vehicleType in GVAR(vehicleTypesConfigured))) then {
    GVAR(vehicleTypesConfigured) pushBack _vehicleType;
    [_theVehicle] call FUNC(addGetinActionsToVehicleType);
};
