/*
 * Author: Pabst Mirror
 * Check if the player can check the ammo of the target static weapon.
 * Either interaction or self-interaction.
 *
 * Argument:
 * 0: Player <OBJECT>
 * 1: Target (or player) <OBJECT>
 *
 * Return value:
 * Can check ammo for statics<BOOL>
 */
#include "script_component.hpp"

PARAMS_2(_player,_target);

//For self interaction, get the player's vehicle
if (_player == _target) then {
    _target = vehicle _player;
};

_target isKindOf "StaticWeapon"
