/*
 * Author: SilentSpike
 * Set inital camera attributes and set as spectator on death
 * Part of the spectator during death system
 *
 * Arguments:
 * 0: Corpse <OBJECT>
 * 1: Killer <OBJECT>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit","_killer"];

if (isNull _killer) then {
    [2,_unit] call FUNC(setCameraAttributes);
} else {
    [2,_killer] call FUNC(setCameraAttributes);
};

[_unit] call FUNC(setSpectator);
