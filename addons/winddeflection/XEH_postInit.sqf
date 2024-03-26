#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(trackedBullets) = [];

["CBA_settingsInitialized", {
    //If not enabled, dont't add PFEH
    if (!GVAR(enabled)) exitWith {};

    // Register fire event handler
    ["ace_firedPlayer", LINKFUNC(handleFired)] call CBA_fnc_addEventHandler;
    ["ace_firedPlayerNonLocal", LINKFUNC(handleFired)] call CBA_fnc_addEventHandler;

    if (GVAR(vehicleEnabled)) then {
        ["ace_firedPlayerVehicle", LINKFUNC(handleFired)] call CBA_fnc_addEventHandler;
        ["ace_firedPlayerVehicleNonLocal", LINKFUNC(handleFired)] call CBA_fnc_addEventHandler;
    };

    [] call FUNC(updateTrajectoryPFH);

}] call CBA_fnc_addEventHandler;
