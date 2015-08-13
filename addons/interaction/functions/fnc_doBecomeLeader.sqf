 /*
 * Author: PabstMirror
 * Become Leader of group
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
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

params ["_target", "_player"];

[QGVAR(selectLeader), (units group _player), [(group _player), _player]] call EFUNC(common,targetEvent);
