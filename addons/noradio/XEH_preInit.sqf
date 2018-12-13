// By commy2
#include "script_component.hpp"

if (isServer) then {
    // Unmute unit if that player disconnects
    addMissionEventHandler ["HandleDisconnect", {
        TRACE_1("re-enabling voice",_this);
        [_this select 0, "isPlayer"] call EFUNC(common,unmuteUnit);
    }];
};

if (hasInterface) then {
    // Mutes/unmutes units when the player changes
    ["unit", {
        if (!GVAR(enabled)) exitWith {};

        params ["_newPlayer", "_oldPlayer"];
        TRACE_2("player change",_newPlayer,_oldPlayer);

        // Mute the new player
        [_newPlayer, "isPlayer"] call EFUNC(common,muteUnit);

        // Unmute the old player
        if (alive _oldPlayer) then {
            [_oldPlayer, "isPlayer"] call EFUNC(common,unmuteUnit);
        };
    }, true] call CBA_fnc_addPlayerEventHandler;
};

[QGVAR(enabled), "CHECKBOX", [LSTRING(setting), LSTRING(setting_tooltip)], format ["ACE %1", localize ELSTRING(common,DisplayName)], true, true, {
    params ["_enabled"];

    if (_enabled) then {
        [ACE_player, "isPlayer"] call EFUNC(common,muteUnit);
    } else {
        [ACE_player, "isPlayer"] call EFUNC(common,unmuteUnit);
    };
}, true // Needs mission restart
] call CBA_settings_fnc_init;
