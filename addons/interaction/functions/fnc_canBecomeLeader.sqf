#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Check if can become group leader.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Able to become leader of group <BOOL>
 *
 * Example:
 * player call ace_interaction_fnc_canBecomeLeader
 *
 * Public: No
 */

params ["_unit"];

count units _unit > 1 && {leader _unit != _unit}
