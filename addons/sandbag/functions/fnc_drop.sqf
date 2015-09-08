/*
 * Author: Garth 'L-H' de Wet, Ruthberg
 * Drop sandbag
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_sandbag_fnc_deployCancel
 *
 * Public: No
 */
#include "script_component.hpp"

if (isNull GVAR(sandBag) || isNull GVAR(carrier)) exitWith {};

[GVAR(carryPFH)] call cba_fnc_removePerFrameHandler;

[GVAR(carrier), "ACE_Sandbag", false] call EFUNC(Common,setForceWalkStatus);
[GVAR(carrier), "DefaultAction", GVAR(carrier) getVariable [QGVAR(drop), -1]] call EFUNC(Common,removeActionEventHandler);

call EFUNC(interaction,hideMouseHint);

GVAR(carrier) playActionNow "PutDown";

[{
    _this setVariable [QGVAR(usingSandbag), false];
}, GVAR(carrier), 1.5, 0.5] call EFUNC(common,waitAndExecute);

[{
    private ["_sandBag", "_position", "_direction"];
    _position = getPosASL GVAR(sandBag);
    _direction = getDir GVAR(sandBag);

    deleteVehicle GVAR(sandBag);

    _sandBag = createVehicle ["ACE_SandbagObject", [0, 0, 0], [], 0, "NONE"];
    _sandBag enableSimulationGlobal true;
    _sandBag setPosASL _position;
    _sandBag setDir _direction;

    GVAR(sandBag) = objNull;
    GVAR(carrier) = objNull;
}, [], 1.0, 0.5] call EFUNC(common,waitAndExecute);
