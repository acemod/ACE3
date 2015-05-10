#include "script_component.hpp"

ADDON = false;

// Extension engine functions
PREP(initializeExtension);
PREP(monitorResultsPFH);
PREP(parseResult);

PREP(callExtension);
GVAR(extensionLibrary) = "z\ace\ace_vd.dll";
GVAR(async) = true;
GVAR(ready) = false;

// Core functionality
PREP(registerVehicleDamageHandler);
PREP(registerVehicleWithExtension);
PREP(unregisterWithExtension);

PREP(dispatchHitPart);
PREP(dispatchDamage);
PREP(doHit);

GVAR(vehicle_id) = 0;

FUNC(_textVector) = {
    private["_str"];
    _str = format["%1;%2;%3", ((_this select 0) select 0), ((_this select 0) select 1), ((_this select 0) select 2)];
    _str
};

ADDON = true;
