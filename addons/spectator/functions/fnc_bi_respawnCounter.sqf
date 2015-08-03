/*
 * Author: Bohemia Interactive (Karel Moricky)
 * Part of the BI respawn framework
 * Handles the respawn timer display
 * Edited to disable counter when spectator is opened
 *
 * Arguments:
 * 0: Corpse/New Unit <OBJECT>
 * 1: Killer/Old Unit <OBJECT>
 * 2: Respawn Type <NUMBER>
 * 3: Respawn Delay <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

_player = [_this,0,objNull,[objnull]] call bis_fnc_param;

_respawnDelay = [_this,3,0,[0]] call bis_fnc_param;

if (!isplayer _player && !isnull _player && _respawnDelay > 0) exitwith {["Attempting to use the function on AI unit %1, can be used only on players."] call bis_fnc_error;};

//--- Engine-triggered respawn
_layer = "BIS_fnc_respawnCounter" call bis_fnc_rscLayer;

if (!alive _player) then {
    if (GVAR(onDeath) || (playerrespawntime < 1)) exitwith {};
    _layer cutrsc ["RscRespawnCounter","plain"];
} else {
    _layer cuttext ["","plain"];
};
