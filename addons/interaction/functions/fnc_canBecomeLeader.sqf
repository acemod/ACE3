/*
 * Author: PabstMirror
 * Test if can Become Leader of group
 *
 * Arguments:
 * 0: target <OBJECT>
 * 1: player <OBJECT>
 *
 * Return Value:
 * <BOOL>
 *
 * Example:
 * [player, player] call ace_interaction_fnc_canBecomeLeader
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_target,_player);

(count (units group _player) > 1) && {leader group _player != _player}
