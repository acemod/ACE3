#include "script_component.hpp"
/*
 * Author: brainslush
 * Keep engine running after player gets out of the vehicle.
 *
 * Arguments:
 * 0: Vehcile <OBJECT>
 * 1: Position <STRING>
 * 2: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [car, "driver", player] call ace_vehicles_fnc_keepEngineAlive
 *
 * Public: No
 */

params ["_vehicle","_position","_unit"];

if (!GVAR(keepEngineRunning)) exitWith {};
if (_unit == ACE_player && {_position == "driver"} && {_vehicle getVariable [QGVAR(engineState),false]}) then {
    [{[QGVAR(engineOnLocal),_this,_this] call CBA_fnc_targetEvent}, _vehicle] call CBA_fnc_execNextFrame;
};