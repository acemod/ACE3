#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(trackedBullets) = [];

["SettingsInitialized", {
    // If not enabled, dont't add PFEH
    if (!GVAR(enabled)) exitWith {};

    // Decide if it should be done on sqf or on the intercept extension
    if (missionNamespace getVariable ["intercept_core_enabled", false]) then {
        // Use the extension
        // @todo: figure out how to solve the extension being on @ace vs z\ace, etc
        "intercept" callExtension "load_extension:z\ace\ace_wind_deflection.dll";
        GVAR(disableEventHandlers) = true;
        ACE_LOGINFO("ace_winddeflection enabled using intercept extension.");
    } else {
        // Go sfq
        [] call FUNC(updateTrajectoryPFH);
        ACE_LOGINFO("ace_winddeflection enabled using sqf.");
    };

}] call EFUNC(common,addEventHandler);
