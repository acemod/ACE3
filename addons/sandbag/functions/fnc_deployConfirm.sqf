/*
 * Author: Garth 'L-H' de Wet, Ruthberg
 * Confirms sandbag deployment
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_sandbag_fnc_deployConfirm;
 *
 * Public: No
 */
#include "script_component.hpp"

if (isNull GVAR(sandBag) || isNull GVAR(placer)) exitWith {};

[GVAR(deployPFH)] call cba_fnc_removePerFrameHandler;

[GVAR(placer), "ACE_Sandbag", false] call EFUNC(Common,setForceWalkStatus);
[GVAR(placer), "DefaultAction", GVAR(placer) getVariable [QGVAR(Deploy),  -1]] call EFUNC(Common,removeActionEventHandler);
[GVAR(placer), "zoomtemp",      GVAR(placer) getVariable [QGVAR(Cancel), -1]] call EFUNC(Common,removeActionEventHandler);

call EFUNC(interaction,hideMouseHint);

GVAR(placer) playActionNow "PutDown";

GVAR(placer) setVariable [QGVAR(usingSandbag), true];
[{
    _this setVariable [QGVAR(usingSandbag), false];
}, GVAR(placer), 1.5, 0.5] call EFUNC(common,waitAndExecute);

[{
    private ["_sandBag", "_position", "_direction"];
    _position = getPosASL GVAR(sandBag);
    _direction = getDir GVAR(sandBag);
    
    deleteVehicle GVAR(sandBag);
    
    _sandBag = createVehicle ["ACE_SandbagObject", [0,0,0], [], 0, "NONE"];
    _sandBag enableSimulationGlobal true;
    _sandBag setPosASL _position;
    _sandBag setDir _direction;
    
    GVAR(placer) removeItem "ACE_Sandbag_empty";
    
    GVAR(sandBag) = objNull;
    GVAR(placer) = objNull;
}, [], 1.0, 0.5] call EFUNC(common,waitAndExecute);
