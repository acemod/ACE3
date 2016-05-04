#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(trackedBullets) = [];

["SettingsInitialized", {
    //If not enabled, dont't add PFEH
    if (!GVAR(enabled)) exitWith {};

    // Register fire event handler
    ["firedPlayer", DFUNC(handleFired)] call EFUNC(common,addEventHandler);
    ["firedPlayerNonLocal", DFUNC(handleFired)] call EFUNC(common,addEventHandler);

    if (GVAR(vehicleEnabled)) then {
        ["firedPlayerVehicle", DFUNC(handleFired)] call EFUNC(common,addEventHandler);
        ["firedPlayerVehicleNonLocal", DFUNC(handleFired)] call EFUNC(common,addEventHandler);
    };

    [] call FUNC(updateTrajectoryPFH);

}] call EFUNC(common,addEventHandler);
