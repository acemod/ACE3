#include "script_component.hpp"
/*
 * Author: Fisher, SilentSpike
 * Toggle Simulation on object.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC] call ace_zeus_fnc_moduleSimulation
 *
 * Public: No
 */

params ["_logic"];

if !(local _logic) exitWith {};

private _object = attachedTo _logic;
if (isNull _object) then {
    [LSTRING(NothingSelected)] call FUNC(showMessage);
} else {
    [QEGVAR(common,enableSimulationGlobal), [_object, !(simulationEnabled _object)]] call CBA_fnc_serverEvent;
};

deleteVehicle _logic;
