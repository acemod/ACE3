#include "script_component.hpp"
/*
 * Author: bux578, commy2
 * Returns the player or curator controlled unit.
 * Use this in INIT and RESPAWN eh scripts, because ACE_player isn't reset yet.
 *
 * Arguments:
 * NONE.
 *
 * Return Value:
 * Player controlled unit <OBJECT>
 *
 * Example:
 * [] call ace_common_fnc_player
 *
 * Public: Yes
 */

missionNamespace getVariable ["bis_fnc_moduleRemoteControl_unit", player]
