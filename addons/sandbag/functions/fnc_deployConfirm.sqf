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

params ["_unit"];

private _sandbag = _unit getVariable [QGVAR(sandBag), objNull];

// Save placement dummy data; Need to check now, as it's deleted later
private _dummyDeleted = isNull _sandbag;
private _position = getPosASL _sandbag;
private _direction = getDir _sandbag;

// Clean up hints and dummy
_unit call FUNC(deployCancel);

// Make sure unit still has empty sandbag, otherwise quit
if (_dummyDeleted || {!alive _unit} || {!([_unit, "ACE_Sandbag_empty"] call EFUNC(common,hasItem))}) exitWith {};

_unit setVariable [QGVAR(isUsingSandbag), true];

// Play animation
[_unit, "PutDown"] call EFUNC(common,doGesture);

[{
    params ["_unit", "_direction", "_position"];

    _unit setVariable [QGVAR(isUsingSandbag), false];

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
