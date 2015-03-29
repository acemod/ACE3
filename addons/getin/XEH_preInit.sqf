#include "script_component.hpp"

ADDON = false;

PREP(addGetinActionsToVehicleType);
PREP(canGetIn);
PREP(doGetIn);
PREP(getEmptyCargoSeat);
PREP(vehicleInitPost);

GVAR(vehicleTypesConfigured) = [];

ADDON = true;
