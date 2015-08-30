// by commy2
#include "script_component.hpp"

/*
[{
    if (!isNull ACE_player) then {
        [(_this select 1)] call cba_fnc_removePerFrameHandler;

        [ACE_player, "isPlayer"] call EFUNC(common,muteUnit);
    };
}, 0, []] call CBA_fnc_addPerFrameHandler;
*/

if (!hasInterface) exitWith {};

// Mutes/unmutes units when the player changes
["playerChanged", {
    EXPLODE_2_PVT(_this,_newPlayer,_oldPlayer);

    // On player change mute the new player
    [_newPlayer, "isPlayer"] call EFUNC(common,muteUnit);

    // Unmute the old player
    if (alive _oldPlayer) then {
        [_oldPlayer, "isPlayer"] call EFUNC(common,unmuteUnit);
    };
}] call EFUNC(common,addEventhandler);
