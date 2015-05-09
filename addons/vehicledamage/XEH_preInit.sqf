#include "script_component.hpp"

ADDON = false;

// Core engine functions

PREP(monitorResultsPFH);

PREP(registerVehicleDamageHandler);
PREP(registerVehicleWithExtension);
PREP(unregisterWithExtension);

PREP(dispatchHitPart);
PREP(dispatchDamage);
PREP(doHit);

// Extension calling functionality
PREP(initializeExtension);

// VD specific effects  middlemen


// Unique local vehicle ID
GVAR(vehicle_id) = 0;

FUNC(_textVector) = {
    private["_str"];
    _str = format["%1;%2;%3", ((_this select 0) select 0), ((_this select 0) select 1), ((_this select 0) select 2)];
    _str
};

ADDON = true;
