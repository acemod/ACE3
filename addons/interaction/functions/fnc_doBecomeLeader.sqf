 /*
 * Author: PabstMirror
 * Become Leader of group
 *
 * Arguments:
 * 0: target <OBJECT>
 * 1: player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, player] call ace_interaction_fnc_doBecomeLeader
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_target,_player);

[QGVAR(selectLeader), (units group _player), [(group _player), _player]] call EFUNC(common,targetEvent);
