#include "script_component.hpp"

if (isServer) then {
    ["CBA_settingsInitialized", {
        TRACE_1("settingInit - server",GVAR(enableCombatDeafness));

        // Only install event handler if combat deafness is enabled
        if (!GVAR(enableCombatDeafness)) exitWith {};

        ["CAManBase", "Init", LINKFUNC(addEarPlugs), true, [], true] call CBA_fnc_addClassEventHandler;
    }] call CBA_fnc_addEventHandler;
};

if (!hasInterface) exitWith {};

#include "initKeybinds.inc.sqf"

GVAR(cacheAmmoLoudness) = createHashMap;

GVAR(deafnessDV) = 0;
GVAR(deafnessPrior) = 0;
GVAR(volume) = 1;
GVAR(playerVehAttenuation) = 1;
GVAR(time3) = 0;
GVAR(damageCoefficent) = 1;
GVAR(volumeAttenuation) = 1;
GVAR(lastPlayerVehicle) = objNull;

["CBA_settingsInitialized", {
    TRACE_1("settingInit",GVAR(enableCombatDeafness));

    // Only run PFEH and install event handlers if combat deafness is enabled
    if (!GVAR(enableCombatDeafness)) exitWith {};

    // Spawn volume updating process
    [LINKFUNC(updateVolume), 1, false] call CBA_fnc_addPerFrameHandler;

    [QGVAR(updateVolume), LINKFUNC(updateVolume)] call CBA_fnc_addEventHandler;

    // Update veh attunation when player veh changes
    ["vehicle", {
        params ["_player", "_vehicle"];

        TRACE_2("vehicle change",_player,_vehicle);
        _this call FUNC(updatePlayerVehAttenuation);

        if (!isNull GVAR(lastPlayerVehicle)) then {
            private _firedEH = GVAR(lastPlayerVehicle) getVariable [QGVAR(firedEH), -1];
            GVAR(lastPlayerVehicle) removeEventHandler ["FiredNear", _firedEH];
            GVAR(lastPlayerVehicle) setVariable [QGVAR(firedEH), nil];
            GVAR(lastPlayerVehicle) = objNull;
            TRACE_2("removed veh eh",_firedEH,GVAR(lastPlayerVehicle));
        };

        if ((!isNull _vehicle) && {_player != _vehicle}) then {
            private _firedEH = _vehicle addEventHandler ["FiredNear", {call FUNC(firedNear)}];
            _vehicle setVariable [QGVAR(firedEH), _firedEH];
            GVAR(lastPlayerVehicle) = _vehicle;
            TRACE_2("added veh eh",_firedEH,GVAR(lastPlayerVehicle));
        };
    }, true] call CBA_fnc_addPlayerEventHandler;

    ["turret", LINKFUNC(updatePlayerVehAttenuation), false] call CBA_fnc_addPlayerEventHandler;

    [QGVAR(firedNear), "FiredNear", LINKFUNC(firedNear), true] call EFUNC(common,addPlayerEH);
    [QGVAR(explosion), "Explosion", LINKFUNC(explosionNear), true] call EFUNC(common,addPlayerEH);
    [QGVAR(slotItemChanged), "SlotItemChanged", {(_this select 2) call FUNC(updateHearingProtection)}, true] call EFUNC(common,addPlayerEH);

    // Reset deafness on respawn (or remote control player switch)
    ["unit", {
        GVAR(deafnessDV) = 0;
        GVAR(deafnessPrior) = 0;
        GVAR(time3) = 0;

        UPDATE_HEARING_EARPLUGS call FUNC(updateHearingProtection);
    }, true] call CBA_fnc_addPlayerEventHandler;
}] call CBA_fnc_addEventHandler;
