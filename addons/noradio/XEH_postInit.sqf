// By commy2
#include "script_component.hpp"

// Unmute unit if that player disconnects
if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {
        if (!GVAR(enabled)) exitWith {};
        TRACE_1("re-enabling voice",_this);
        [_this select 0, "isPlayer"] call EFUNC(common,unmuteUnit);
    }];
};

if (!hasInterface) exitWith {};

["ace_settingsInitialized", {
    TRACE_1("settingsInitialized",GVAR(enabled));
    if (!GVAR(enabled)) exitWith {};

    // Mutes/unmutes units when the player changes
    ["unit", {
        params ["_newPlayer", "_oldPlayer"];
        TRACE_2("player change",_newPlayer,_oldPlayer);

        // Mute the new player
        [_newPlayer, "isPlayer"] call EFUNC(common,muteUnit);

        // Unmute the old player
        if (alive _oldPlayer) then {
            [_oldPlayer, "isPlayer"] call EFUNC(common,unmuteUnit);
        };
    }, true] call CBA_fnc_addPlayerEventHandler;
}] call CBA_fnc_addEventHandler;
