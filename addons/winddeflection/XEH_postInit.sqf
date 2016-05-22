#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(trackedBullets) = [];

["SettingsInitialized", {
    //If not enabled, dont't add PFEH
    if (!GVAR(enabled)) exitWith {};

    // Register fire event handler
    ["firedPlayer", DFUNC(handleFired)] call CBA_fnc_addEventHandler;
    ["firedPlayerNonLocal", DFUNC(handleFired)] call CBA_fnc_addEventHandler;

    if (GVAR(vehicleEnabled)) then {
        ["firedPlayerVehicle", DFUNC(handleFired)] call CBA_fnc_addEventHandler;
        ["firedPlayerVehicleNonLocal", DFUNC(handleFired)] call CBA_fnc_addEventHandler;
    };

    [] call FUNC(updateTrajectoryPFH);

}] call CBA_fnc_addEventHandler;
