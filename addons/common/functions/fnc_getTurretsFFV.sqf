#include "script_component.hpp"
/*
 * Author: commy2
 * Get the turret indices of ffv turrets.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Vehicle FFV Turret indecies <ARRAY>
 *
 * Example:
 * [car] call ace_common_fnc_getTurretsFFV
 *
 * Public: Yes
 */

params [["_vehicle", objNull, [objNull]]];

fullCrew [_vehicle, "turret", true] select {_x select 4} apply {_x select 3} // return
