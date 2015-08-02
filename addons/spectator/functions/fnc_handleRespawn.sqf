/*
 * Author: SilentSpike
 * Un-set as spectator on respawn
 * Part of the spectator during death system
 *
 * Arguments:
 * 0: New unit <OBJECT>
 * 1: Old unit <OBJECT>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

[_unit,false] call FUNC(setSpectator);
