/*
 * Author: SilentSpike
 * Cache necessary details and process unit for spectator on death
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

private ["_unit","_killer"];
_unit = _this select 0;
_killer = _this select 1;

// Remove from group to prevent appearing on HUD upon respawn
[_unit, true, QGVAR(isSpectator), side group _unit] call EFUNC(common,switchToGroupSide);
