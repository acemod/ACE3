/*
 * Author: SilentSpike
 * Start the spectator camera spectator on respawn
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

[_this select 1] call FUNC(setSpectator);
