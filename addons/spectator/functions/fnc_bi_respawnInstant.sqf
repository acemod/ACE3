/*
 * Author: Bohemia Interactive
 * Part of the BI respawn framework
 * Handles instant respawn type (respawn at position of death)
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

if !(GVAR(onDeath)) exitWith {};

params [["_unit",objNull,[objNull]], ["_killer",objNull,[objNull]]];

if (alive _unit) then {
    [_unit,false] call FUNC(setSpectator);
} else {
    private ["_vision","_pos"];
    if (isNull _killer) then {_killer = _unit};
    _vision = [-2,-1] select (sunOrMoon < 1);
    _pos = (getPosATL _unit) vectorAdd [0,0,5];

    [2,_killer,_vision,_pos,getDir _unit] call FUNC(setCameraAttributes);
    [_unit] call FUNC(setSpectator);
};
