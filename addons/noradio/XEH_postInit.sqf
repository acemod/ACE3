// by commy2
#include "script_component.hpp"

// unmute unit if that player disconnects
if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {
        [_this select 0, "isPlayer"] call CFUNC(unmuteUnit);
    }];
};

if (!hasInterface) exitWith {};

// mutes/unmutes units when the player changes
["playerChanged", {
    params ["_newPlayer", "_oldPlayer"];

    // mute the new player
    [_newPlayer, "isPlayer"] call CFUNC(muteUnit);

    // unmute the old player
    if (alive _oldPlayer) then {
        [_oldPlayer, "isPlayer"] call CFUNC(unmuteUnit);
    };
}] call CFUNC(addEventhandler);
