/*
 * Author: bux578, commy2, akalegman
 *
 * Checks if a unit is a player / curator controlled unit.
 * Currently returns false for non-local remote controlled zeus units. (Remotes from another zeus machine)
 *
 * Arguments:
 * 0: unit to be checked <OBJECT>
 * 1: exclude remote controlled units (BOOLEAN)
 *
 * Return Value:
 * is unit a player (BOOLEAN)
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unit", "_excludeRemoteControlled"];

params ["_unit", ["_excludeRemoteControlled", false]];

isPlayer _unit || (!_excludeRemoteControlled && {_unit == call FUNC(player)})
