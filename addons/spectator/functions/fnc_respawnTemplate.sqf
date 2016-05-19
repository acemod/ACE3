/*
 * Author: SilentSpike
 * The ace_spectator respawn template, handles killed + respawn
 * Can be used via BI's respawn framework, see:
 * https://community.bistudio.com/wiki/Arma_3_Respawn
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
private ["_vision","_pos"];

// When all are dead with respawn type "None" the mission should end
if ((_respawn == 0) && {{alive _x} count allPlayers <= 0}) exitWith {
    [["endDeath",false],"BIS_fnc_endMission"] call EFUNC(common,execRemoteFnc);
};

// Some environment information can be used for the initial camera attributes
if (isNull _killer) then {_killer = _unit};
_vision = [-2,-1] select (sunOrMoon < 1);
_pos = (getPosATL _unit) vectorAdd [0,0,5];

// Enter/exit spectator based on the respawn type and whether killed/respawned
if (alive _unit) then {
    if (_respawn == 1) then {
        [_unit] call FUNC(stageSpectator);
        [2,_killer,_vision,_pos,getDir _unit] call FUNC(setCameraAttributes);
        [true] call FUNC(setSpectator);
    } else {
        [false] call FUNC(setSpectator);
    };
} else {
    // Negligible respawn delay can result in entering spectator after respawn
    if (playerRespawnTime <= 1) exitWith {};

    [2,_killer,_vision,_pos,getDir _unit] call FUNC(setCameraAttributes);
    [true] call FUNC(setSpectator);
};
