#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(deafnessDV) = 0;
GVAR(deafnessPrior) = 0;
GVAR(volume) = 1;
GVAR(playerVehAttenuation) = 1;

GVAR(beep) = false;
GVAR(beep2) = false;
GVAR(time2) = 0;
GVAR(time3) = 0;
GVAR(time4) = 0;

["SettingsInitialized", {
    // Spawn volume updating process
    [FUNC(updateVolume), 1, [false]] call CBA_fnc_addPerFrameHandler;
}] call EFUNC(common,addEventHandler);

//Update veh attunation when player veh changes
["playerVehicleChanged", {_this call FUNC(updatePlayerVehAttenuation);}] call EFUNC(common,addEventHandler);
["playerTurretChanged", {_this call FUNC(updatePlayerVehAttenuation);}] call EFUNC(common,addEventHandler);

//Reset deafness on respawn (or remote control player switch)
["playerChanged", {
    GVAR(deafnessDV) = 0;
    GVAR(deafnessPrior) = 0;
    ACE_player setvariable [QGVAR(deaf), false];

    GVAR(beep) = false;
    GVAR(beep2) = false;
    GVAR(time2) = 0;
    GVAR(time3) = 0;
    GVAR(time4) = 0;
}] call EFUNC(common,addEventhandler);
