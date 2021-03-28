#include "script_component.hpp"
/*
 * Author: commy2
 * Get the turret index of a vehicles copilot.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Vehicle Copilot Turret indecies <ARRAY>
 *
 * Example:
 * [car] call ace_common_fnc_getTurretCopilot
 *
 * Public: Yes
 */

params [["_vehicle", objNull, [objNull]]];

fullCrew [_vehicle, "turret", true] apply {_x select 3} select {
    getNumber ([_vehicle, _x] call CBA_fnc_getTurret >> "isCopilot") == 1
} param [0, []] // return
