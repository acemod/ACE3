#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(trackedBullets) = [];

["SettingsInitialized", {
    //If not enabled, dont't add PFEH
    if (!GVAR(enabled)) exitWith {};

    [] call FUNC(updateTrajectoryPFH);

}] call EFUNC(common,addEventHandler);
