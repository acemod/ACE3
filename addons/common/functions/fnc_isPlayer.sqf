/*
 * Author: bux578, commy2, akalegman
 *
 * Checks if a unit is a player / curator controlled unit.
 * Currently returns false for non-local remote controlled zeus units. (Remotes from another zeus machine)
 *
 * Arguments:
 * 0: unit to be checked (object)
 * 1: exclude curator controlled units (boolean)
 *
 * Return Value:
 * Bool: is unit a player?
 */
#include "script_component.hpp"

private ["_unit", "_excludeRemote"];

_unit               = [_this, 0] call BIS_fnc_param;
_excludeRemote      = [_this, 1, false] call BIS_fnc_param;

isPlayer _unit || (!_excludeRemote && {_unit == call FUNC(player)})
