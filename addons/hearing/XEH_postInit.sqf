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

    // Spawn volume updating process
    [LINKFUNC(updateVolume), 1, [false]] call CBA_fnc_addPerFrameHandler;

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


    // Reset deafness on respawn (or remote control player switch)
    ["unit", {
        params ["_player", "_oldPlayer"];
        TRACE_2("unit change",_player,_oldPlayer);

        if (!isNull _oldPlayer) then {
            private _firedEH = _oldPlayer getVariable [QGVAR(firedEH), -1];
            _oldPlayer removeEventHandler ["FiredNear", _firedEH];
            _oldPlayer setVariable [QGVAR(firedEH), nil];
            private _explosionEH = _oldPlayer getVariable [QGVAR(explosionEH), -1];
            _oldPlayer removeEventHandler ["Explosion", _explosionEH];
            _oldPlayer setVariable [QGVAR(explosionEH), nil];
            TRACE_3("removed unit eh",_oldPlayer,_firedEH,_explosionEH);
        };
        // Don't add a new EH if the unit respawned
        if ((_player getVariable [QGVAR(firedEH), -1]) == -1) then {
            if ((getNumber (configFile >> "CfgVehicles" >> (typeOf _player) >> "isPlayableLogic")) == 1) exitWith {
                TRACE_1("skipping playable logic",typeOf _player); // VirtualMan_F (placeable logic zeus / spectator)
            };
            private _firedEH = _player addEventHandler ["FiredNear", {call FUNC(firedNear)}];
            _player setVariable [QGVAR(firedEH), _firedEH];
            private _explosionEH = _player addEventHandler ["Explosion", {call FUNC(explosionNear)}];
            _player setVariable [QGVAR(explosionEH), _explosionEH];
            TRACE_3("added unit eh",_player,_firedEH,_explosionEH);
        };

        GVAR(deafnessDV) = 0;
        GVAR(deafnessPrior) = 0;
        GVAR(time3) = 0;
        [] call FUNC(updateHearingProtection);
    }, true] call CBA_fnc_addPlayerEventHandler;

    // Update protection on possible helmet change
    ["loadout", LINKFUNC(updateHearingProtection), false] call CBA_fnc_addPlayerEventHandler;
}] call CBA_fnc_addEventHandler;
