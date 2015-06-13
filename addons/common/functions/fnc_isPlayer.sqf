/*
 * Author: bux578, commy2, akalegman
 *
 * Checks if a unit is a player / curator controlled unit.
 * Currently returns false for non-local remote controlled zeus units. (Remotes from another zeus machine)
 *
 * Arguments:
 * 0: unit to be checked (object)
 * 1: exclude remote controlled units (boolean)
 *
 * Return Value:
 * Bool: is unit a player?
 */
#include "script_component.hpp"

private ["_unit", "_excludeRemoteControlled"];

_unit                         = _this select 0;
_excludeRemoteControlled      = if (count _this > 1) then {_this select 1} else {false};

isPlayer _unit || (!_excludeRemoteControlled && {_unit == call FUNC(player)})
