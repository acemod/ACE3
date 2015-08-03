/*
 * Author: Bohemia Interactive
 * Part of the BI respawn framework
 * Handles wave respawning system
 * Edited to support ace_spectator integration
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

params [["_unit",objNull,[objNull]], ["_killer",objNull,[objNull]], ["_respawn",0,[0]], ["_respawnDelay",0,[0]]];

if (!isplayer _unit && !isnull _unit) exitwith {["Attempting to use the function on AI unit %1, can be used only on players."] call bis_fnc_error;};

if (!alive _unit) then {
    //--- Set the time only when it was not modified already
    if (_respawnDelay != 0 && _respawnDelay == playerrespawntime) then {
        setplayerrespawntime (_respawnDelay + _respawnDelay - (servertime % _respawnDelay));

        if !(GVAR(onDeath)) exitWith {};
        private ["_vision","_pos"];

        if (isNull _killer) then {_killer = _unit};
        _vision = [-2,-1] select (sunOrMoon < 1);
        _pos = (getPosATL _unit) vectorAdd [0,0,5];

        [2,_killer,_vision,_pos,getDir _unit] call FUNC(setCameraAttributes);
        [_unit] call FUNC(setSpectator);
    };
} else {
    setplayerrespawntime _respawndelay;
    [_unit,false] call FUNC(setSpectator);
};
