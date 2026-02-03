#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, Ruthberg, edited by commy2 for better MP and eventual AI support
 * Confirms sandbag deployment.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_sandbag_fnc_deployConfirm
 *
 * Public: No
 */

if (GVAR(deployPFH) == -1) exitWith {};

// Save placement dummy data
private _position = getPosASL GVAR(sandBag);
private _direction = getDir GVAR(sandBag);

params ["_unit"];

// Clean up hints and dummy
_unit call FUNC(deployCancel);

// Make sure unit still has empty sandbag, otherwise quit
if (!alive _unit || {!([_unit, "ACE_Sandbag_empty"] call EFUNC(common,hasItem))}) exitWith {};

// Play animation
[_unit, "PutDown"] call EFUNC(common,doGesture);

[{
    params ["_unit", "_direction", "_position"];

    // Make sure unit still has empty sandbag, otherwise quit
    if (!alive _unit || {!([_unit, "ACE_Sandbag_empty"] call EFUNC(common,hasItem))}) exitWith {};

    // Remove sandbag from inventory
    _unit removeItem "ACE_Sandbag_empty";

    // Create real sandbag
    private _sandBag = createVehicle ["ACE_SandbagObject", [0, 0, 0], [], 0, "NONE"];

    _sandBag setDir _direction;
    _sandBag setPosASL _position;

    // Prevent collision damage
    [QEGVAR(common,fixCollision), _unit] call CBA_fnc_localEvent;
    [QEGVAR(common,fixCollision), _sandBag] call CBA_fnc_localEvent;
}, [_unit, _direction, _position], 0.5] call CBA_fnc_waitAndExecute;
