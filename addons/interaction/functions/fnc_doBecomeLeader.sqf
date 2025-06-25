#include "..\script_component.hpp"
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

params ["_unit"];

[QEGVAR(common,selectLeader), [group _unit, _unit], units _unit] call CBA_fnc_targetEvent;
