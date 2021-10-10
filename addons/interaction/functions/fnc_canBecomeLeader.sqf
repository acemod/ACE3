#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Test if can Become Leader of group.
 *
 * Arguments:
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Able to become leader of group <BOOL>
 *
 * Example:
 * [player] call ace_interaction_fnc_canBecomeLeader
 *
 * Public: No
 */

params ["_unit"];

count units group _unit > 1 && {leader group _unit != _unit}
