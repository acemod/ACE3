 /*
 * Author: PabstMirror
 * Become Leader of group
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit <OBJECT>
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

params ["_target", "_unit"];

["selectLeader", units group _unit, [group _unit, _unit]] call EFUNC(common,targetEvent);
