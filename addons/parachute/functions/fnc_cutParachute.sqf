#include "script_component.hpp"
/*
 * Author: joko, Jonas, SilentSpike
 * Perform the cut parachute action (move unit out and delete)
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Parachute <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, vehicle player] call ace_parachute_fnc_cutParachute;
 *
 * Public: No
 */
params ["_unit", "_parachute"];
TRACE_2("cutParachute", _unit, _parachute);

playSound3d ["A3\Sounds_F\characters\parachute\parachute_landing.wss", _unit];
_unit action ["GetOut", _parachute];
deleteVehicle _parachute;
