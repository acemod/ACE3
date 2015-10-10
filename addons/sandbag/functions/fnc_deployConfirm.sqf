/*
 * Author: Garth 'L-H' de Wet, Ruthberg, edited by commy2 for better MP and eventual AI support
 * Confirms sandbag deployment
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call ace_sandbag_fnc_deployConfirm
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

// enable running again
[_unit, "ACE_Sandbag", false] call EFUNC(common,setForceWalkStatus);

// remove sandbag from inventory
_unit removeItem "ACE_Sandbag_empty";

// delete placement dummy and create real sandbag
[{
    if (isNull GVAR(sandBag)) exitWith {};

    params ["_unit"];

    private ["_position", "_direction", "_sandBag"];

    _position = getPosASL GVAR(sandBag);
    _direction = getDir GVAR(sandBag);

    deleteVehicle GVAR(sandBag);

    _sandBag = createVehicle ["ACE_SandbagObject", [0, 0, 0], [], 0, "NONE"];
    _sandBag setPosASL _position;
    _sandBag setDir _direction;

    GVAR(sandBag) = objNull;
}, [_unit], 1] call EFUNC(common,waitAndExecute);

// remove deployment pfh
[GVAR(deployPFH)] call CBA_fnc_removePerFrameHandler;
GVAR(deployPFH) = -1;

// remove mouse button actions
call EFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(Deploy), -1]] call EFUNC(common,removeActionEventHandler);
[_unit, "zoomtemp",      _unit getVariable [QGVAR(Cancel), -1]] call EFUNC(common,removeActionEventHandler);

// play animation
_unit playActionNow "PutDown";

_unit setVariable [QGVAR(isDeploying), false, true];
