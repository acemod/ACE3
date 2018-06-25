#include "script_component.hpp"
/*
 * Author: commy2
 * Get the turret index of a vehicles commander.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Vehicle commander turrent indecies <ARRAY>
 *
 * Example:
 * [car] call ace_common_fnc_getTurretCommander
 *
 * Public: Yes
 */

params [["_vehicle", objNull, [objNull]]];

fullCrew [_vehicle, "commander", true] apply {_x select 3} param [0, []] // return
