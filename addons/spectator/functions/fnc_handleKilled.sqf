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

private ["_unit","_killer","_delay"];
_unit = _this select 0;
_killer = _this select 1;

//Cache resettable info if player died while not already a spectator
if !(_unit getVariable [QGVAR(isSpectator),false]) then {
    GVAR(cachedGroup) = group _unit;
    GVAR(cachedSide) = side GVAR(cachedGroup);
};

// Remove from group to prevent appearing on HUD upon respawn
[_unit] joinSilent grpNull;
