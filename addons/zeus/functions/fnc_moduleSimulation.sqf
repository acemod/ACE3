/*
 * Author: Fisher
 * Toggle Simulation on object.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
 
 #include "script_component.hpp"
 
 params ["_logic"];
 
 if !(local _logic) exitWith {};

 private _object = attachedTo _logic;
 if (isNull _object) then {
    [LSTRING(NoObjectSelected)] call EFUNC(common,displayTextStructured);
 } else {
    private _simulationEnabled = simulationEnabled _object;
    [[_object, (!_simulationEnabled)],"enableSimulationGlobal",false] call BIS_fnc_MP;
 };

 deleteVehicle _logic;