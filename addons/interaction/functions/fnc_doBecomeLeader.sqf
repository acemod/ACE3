 /*
 * Author: PabstMirror
 * Become Leader of group.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_interaction_fnc_doBecomeLeader
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

["selectLeader", units group _unit, [group _unit, _unit]] call EFUNC(common,targetEvent);
