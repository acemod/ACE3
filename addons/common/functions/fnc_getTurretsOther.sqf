/*
 * Author: commy2
 * Get the turret indices of other turrets (not gunner, commander, copilot or ffv).
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Vehicle Other Turret indecies <ARRAY>
 *
 * Example:
 * [car] call ace_common_fnc_getTurretsOther
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_vehicle", objNull, [objNull]]];

fullCrew [_vehicle, "turret", true] select {!(_x select 4)} apply {_x select 3} select {
    getNumber ([_vehicle, _x] call CBA_fnc_getTurret >> "isCopilot") != 1
} // return
