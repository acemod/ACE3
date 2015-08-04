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

if (isNull _killer) then {_killer = _unit};
_vision = [-2,-1] select (sunOrMoon < 1);
_pos = (getPosATL _unit) vectorAdd [0,0,5];

if (alive _unit) then {
    if (_respawn == 1) then {
        [_unit,QGVAR(isSeagull)] call EFUNC(common,hideUnit);
        [2,_killer,_vision,_pos,getDir _unit] call FUNC(setCameraAttributes);
        [_unit] call FUNC(setSpectator);
    } else {
        [_unit,false] call FUNC(setSpectator);
    };
} else {
    [2,_killer,_vision,_pos,getDir _unit] call FUNC(setCameraAttributes);
    [_unit] call FUNC(setSpectator);
};
