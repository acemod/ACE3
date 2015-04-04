/*
 * Author: Pabst Mirror
 * Check if the player can check the ammo of the target static weapon.
 * Either interaction or self-interaction.
 *
 * Argument:
 * 0: Target (or player) <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return value:
 * Can check ammo for statics<BOOL>
 *
 * Example:
 * [player, mortar] call ace_reload_fnc_canCheckAmmoHover
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_target,_player);

//Can't think of any conditions that actually need to be checked...
true
