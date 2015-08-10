/*
 * Author: Glowbal
 * Check if player can load item into the nearest vehicle
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Object to load <OBJECT>
 *
 * Return value:
 * Can load <BOOL>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_player", "_object"];

private ["_nearestVehicle"];
_nearestVehicle = [_player] call FUNC(findNearestVehicle);
if (isNull _nearestVehicle) exitwith {false};

[_object, _nearestVehicle] call FUNC(canLoadItemIn);
