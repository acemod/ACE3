#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(currentDeafness) = 0;
GVAR(newStrength) = 0;
GVAR(playerVehAttenuation) = 1;

// Spawn volume updating process
[FUNC(updateVolume), 0.1, [] ] call CBA_fnc_addPerFrameHandler;

//Update veh attunation when player veh changes
["playerVehicleChanged", {_this call FUNC(updatePlayerVehAttenuation);}] call EFUNC(common,addEventHandler);
["playerTurretChanged", {_this call FUNC(updatePlayerVehAttenuation);}] call EFUNC(common,addEventHandler);

//Reset deafness on respawn (or remote control player switch)
["playerChanged", {
    GVAR(currentDeafness) = 0;
    GVAR(newStrength) = 0;
}] call EFUNC(common,addEventhandler);
