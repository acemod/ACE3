#include "script_component.hpp"
/*
 * Author: commy2
 * Get the turret index of a vehicles gunner.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Vehicle Gunner Turret indecies <ARRAY>
 *
 * Example:
 * [car] call ace_common_fnc_getTurretGunner
 *
 * Public: Yes
 */

params [["_vehicle", objNull, [objNull]]];

fullCrew [_vehicle, "gunner", true] apply {_x select 3} param [0, []] // return
