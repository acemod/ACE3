/*
 * Author: PabstMirror
 * Test if can Become Leader of group
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Able to become leader of group <BOOL>
 *
 * Example:
 * _bool = [player, player] call ace_interaction_fnc_canBecomeLeader
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_target,_player);

(count (units group _player) > 1) && {leader group _player != _player}
