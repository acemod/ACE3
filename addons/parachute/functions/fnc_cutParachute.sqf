/*
 * Author: joko, Jonas, SilentSpike
 * Perform the cut parachute action (move unit out and delete)
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, vehicle player] call FUNC(cutParachute);
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_unit", "_parachute"];
_unit action ["GetOut", _parachute];
deleteVehicle _parachute;
