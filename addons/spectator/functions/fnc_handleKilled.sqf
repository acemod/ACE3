/*
 * Author: SilentSpike
 * Cache necessary details and process unit for spectator on death
 * Part of the basic spectator system
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

// Remove from group to prevent appearing on HUD upon respawn
[_unit, true, QGVAR(isSpectator), side group _unit] call EFUNC(common,switchToGroupSide);

if (isNull _killer) then {
    [2,_unit] call FUNC(setCameraAttributes);
} else {
    [2,_killer] call FUNC(setCameraAttributes);
};
