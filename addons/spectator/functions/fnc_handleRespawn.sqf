/*
 * Author: SilentSpike
 * Start the spectator camera spectator on respawn
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

[_this select 0] call FUNC(setSpectator);
