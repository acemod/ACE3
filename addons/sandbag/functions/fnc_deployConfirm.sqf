#include "..\script_component.hpp"
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

params ["_unit"];

// Enable running again
[_unit, QEGVAR(common,forceWalk), QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
[_unit, QEGVAR(common,blockThrow), QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

// Remove sandbag from inventory
_unit removeItem "ACE_Sandbag_empty";

// Delete placement dummy and create real sandbag
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

// Remove deployment pfh
[GVAR(deployPFH)] call CBA_fnc_removePerFrameHandler;
GVAR(deployPFH) = -1;

// Remove mouse button actions
call EFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(Deploy), -1]] call EFUNC(common,removeActionEventHandler);

// Play animation
[_unit, "PutDown"] call EFUNC(common,doGesture);

_unit setVariable [QGVAR(isDeploying), false, true];
