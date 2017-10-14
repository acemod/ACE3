/*
 * Author: SilentSpike
 * Return all of the player entities who are currently in ace spectator
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Spectator Players <ARRAY>
 *
 * Example:
 * [] call ace_spectator_fnc_players
 *
 * Public: Yes
 */

#include "script_component.hpp"

allPlayers select { GETVAR(_x,GVAR(isSet),false) }
