#include "script_component.hpp"
/*
 * Author: Kingsley
 * Gets the budget for the given side.
 *
 * Arguments:
 * 0: Side <SIDE>
 *
 * Return Value:
 * Budget <NUMBER>
 *
 * Example:
 * [west] call ace_fortify_fnc_getBudget
 *
 * Public: Yes
 */

params ["_side"];

(missionNamespace getVariable [format [QGVAR(Budget_%1), _side], -1])
