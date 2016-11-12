/*
 * Author: Fisher
 * Toggle Simulation on object (runs on server only via module framework).
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

private _object = attachedTo _logic;
if (isNull _object) then {
    [LSTRING(NoObjectSelected)] call EFUNC(common,displayTextStructured);
} else {
    if (isMultiplayer) then {
        _object enableSimulationGlobal !(simulationEnabled _object);
    } else {
        _object enableSimulation !(simulationEnabled _object);
    };
};

deleteVehicle _logic;
 