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
[_unit, "forceWalk", "ACE_Sandbag", false] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", "ACE_Sandbag", false] call EFUNC(common,statusEffect_set);

// remove sandbag from inventory
_unit removeItem "ACE_Sandbag_empty";

// delete placement dummy and create real sandbag
[{
    if (isNull GVAR(sandBag)) exitWith {};

    params ["_unit"];

    private _position = getPosASL GVAR(sandBag);
    private _direction = getDir GVAR(sandBag);

    deleteVehicle GVAR(sandBag);

    private _sandBag = createVehicle ["ACE_SandbagObject", [0, 0, 0], [], 0, "NONE"];
    _sandBag setPosASL _position;
    _sandBag setDir _direction;

    GVAR(sandBag) = objNull;
}, [_unit], 1] call CBA_fnc_waitAndExecute;

// remove deployment pfh
[GVAR(deployPFH)] call CBA_fnc_removePerFrameHandler;
GVAR(deployPFH) = -1;

// remove mouse button actions
call EFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(Deploy), -1]] call EFUNC(common,removeActionEventHandler);

// play animation
[_unit, "PutDown"] call EFUNC(common,doGesture);

_unit setVariable [QGVAR(isDeploying), false, true];
