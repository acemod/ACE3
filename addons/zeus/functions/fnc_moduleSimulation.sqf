/*
 * Author: Fisher
 * Toggle Simulation on object
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * None <NIL>
 *
 *
 * Public: No
 */
 
 #include "script_component.hpp"
 
 params ["_logic"];
 private ["_object","_simulationEnabled"];
 
 if !(local _logic) exitWith {};

 _object = attachedTo _logic;
if (isNull _object) then {
    [LSTRING(NoObjectSelected)] call EFUNC(common,displayTextStructured);
} else {
	_simulationEnabled = simulationEnabled _object;
	_object enableSimulationGlobal (!_simulationEnabled);
};

deleteVehicle _logic;