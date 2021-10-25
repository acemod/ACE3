#include "script_component.hpp"
/*
 * Author: Kingsley
 * Gets the cost for the given side and classname.
 *
 * Arguments:
 * 0: Side <SIDE>
 * 1: Classname <STRING>
 *
 * Return Value:
 * Cost <NUMBER>
 *
 * Example:
 * [west, "Sandbag"] call ace_fortify_fnc_getCost
 *
 * Public: Yes
 */

params ["_side", "_classname"];

private _objects = missionNamespace getVariable [format [QGVAR(Objects_%1), _side], []];

(((_objects select {(_x select 0) == _classname}) param [0, []]) param [1, 0])
