#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(trackedBullets) = [];

["SettingsInitialized", {
    //If not enabled, dont't add PFEH
    if (!GVAR(enabled)) exitWith {};

    // Register fire event handler
    ["firedPlayer", DFUNC(handleFired)] call CFUNC(addEventHandler);
    ["firedPlayerNonLocal", DFUNC(handleFired)] call CFUNC(addEventHandler);

    if (GVAR(vehicleEnabled)) then {
        ["firedPlayerVehicle", DFUNC(handleFired)] call CFUNC(addEventHandler);
        ["firedPlayerVehicleNonLocal", DFUNC(handleFired)] call CFUNC(addEventHandler);
    };

    [] call FUNC(updateTrajectoryPFH);

}] call CFUNC(addEventHandler);
