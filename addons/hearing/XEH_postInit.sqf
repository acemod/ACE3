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
GVAR(lastPlayerVehicle) = objNull;

["ace_settingsInitialized", {
    TRACE_1("settingInit",GVAR(EnableCombatDeafness));
    // Only run PFEH and install event handlers if combat deafness is enabled
    if (!GVAR(EnableCombatDeafness)) exitWith {};

    // Update hearing protection now:
    [] call FUNC(updateHearingProtection);

    // Spawn volume updating process
    [FUNC(updateVolume), 1, [false]] call CBA_fnc_addPerFrameHandler;

    // Update veh attunation when player veh changes
    ["vehicle", {
        _this call FUNC(updatePlayerVehAttenuation);
        
        params ["", "_vehicle"];
        if (!isNull GVAR(lastPlayerVehicle)) then {
            [GVAR(lastPlayerVehicle), QUOTE(ADDON), "FiredNear", {}] call EFUNC(common,setUniqueEventHandler);
            [GVAR(lastPlayerVehicle), QUOTE(ADDON), "Explosion", {}] call EFUNC(common,setUniqueEventHandler);
        };
        if ((!isNull _vehicle) && {ace_player != _vehicle}) then {
            [_vehicle, QUOTE(ADDON), "FiredNear", FUNC(firedNear)] call EFUNC(common,setUniqueEventHandler);
            [_vehicle, QUOTE(ADDON), "Explosion", FUNC(explosionNear)] call EFUNC(common,setUniqueEventHandler);
            GVAR(lastPlayerVehicle) = _vehicle;
        };
    }] call CBA_fnc_addPlayerEventHandler;

    ["turret", FUNC(updatePlayerVehAttenuation)] call CBA_fnc_addPlayerEventHandler;

    // Reset deafness on respawn (or remote control player switch)
    ["unit", {
        params ["_player", "_oldPlayer"];
        [_oldPlayer, QUOTE(ADDON), "FiredNear", {}] call EFUNC(common,setUniqueEventHandler);
        [_oldPlayer, QUOTE(ADDON), "Explosion", {}] call EFUNC(common,setUniqueEventHandler);
        [_player, QUOTE(ADDON), "FiredNear", FUNC(firedNear)] call EFUNC(common,setUniqueEventHandler);
        [_player, QUOTE(ADDON), "Explosion", FUNC(explosionNear)] call EFUNC(common,setUniqueEventHandler);

        GVAR(deafnessDV) = 0;
        GVAR(deafnessPrior) = 0;
        ACE_player setVariable [QGVAR(deaf), false];
        GVAR(time3) = 0;
        [] call FUNC(updateHearingProtection);
    }] call CBA_fnc_addPlayerEventHandler;

    // Update protection on possible helmet change
    ["loadout", FUNC(updateHearingProtection)] call CBA_fnc_addPlayerEventHandler;
}] call CBA_fnc_addEventHandler;
