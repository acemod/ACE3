#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(cacheAmmoLoudness) = call CBA_fnc_createNamespace;

GVAR(deafnessDV) = 0;
GVAR(deafnessPrior) = 0;
GVAR(volume) = 1;
GVAR(playerVehAttenuation) = 1;
GVAR(time3) = 0;
GVAR(damageCoefficent) = 1;
GVAR(volumeAttenuation) = 1;

["SettingsInitialized", {
    TRACE_1("settingInit",GVAR(EnableCombatDeafness));
    // Only run PFEH and install event handlers if combat deafness is enabled
    if (!GVAR(EnableCombatDeafness)) exitWith {};

    // Update hearing protection now:
    [] call FUNC(updateHearingProtection);

    // Spawn volume updating process
    [FUNC(updateVolume), 1, [false]] call CBA_fnc_addPerFrameHandler;

    // Update veh attunation when player veh changes
    ["playerVehicleChanged", {_this call FUNC(updatePlayerVehAttenuation);}] call EFUNC(common,addEventHandler);
    ["playerTurretChanged", {_this call FUNC(updatePlayerVehAttenuation);}] call EFUNC(common,addEventHandler);

    // Reset deafness on respawn (or remote control player switch)
    ["playerChanged", {
        GVAR(deafnessDV) = 0;
        GVAR(deafnessPrior) = 0;
        ACE_player setVariable [QGVAR(deaf), false];
        GVAR(time3) = 0;
        [] call FUNC(updateHearingProtection);
    }] call EFUNC(common,addEventhandler);

    // Update protection on possible helmet change
    ["playerInventoryChanged", {[] call FUNC(updateHearingProtection);}] call EFUNC(common,addEventhandler);
}] call EFUNC(common,addEventHandler);
