/*
 * Author: bux578, commy2, akalegman
 * Checks if a unit is a player / curator controlled unit.
 * Currently returns false for non-local remote controlled zeus units. (Remotes from another zeus machine)
 *
 * Arguments:
 * 0: unit to be checked <OBJECT>
 * 1: exclude remote controlled units <BOOL>
 *
 * Return Value:
 * Is unit a player? <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", ["_excludeRemoteControlled", false]];

isPlayer _unit || (!_excludeRemoteControlled && {_unit == call FUNC(player)}) // return
