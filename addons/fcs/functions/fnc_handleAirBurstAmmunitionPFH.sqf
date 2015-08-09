/*
 * Author: commy2
 *
 * Called from config. Can player reset FCS?
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_position", "_subMunition"];
params ["_args", "_idPFH"];
_args params ["_vehicle", "_projectile", "_zeroing"];

if (isNull _projectile || {!alive _projectile}) exitWith {
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

if (_projectile distance _vehicle < _zeroing) exitWith {};

_position = getPosATL _projectile;

_subMunition = createVehicle ["ACE_B_35mm_ABM_Helper", _position, [], 0, "FLY"];
_subMunition setPosATL _position;
_subMunition setVelocity [0, 0, -10];

deleteVehicle _projectile;

[_idPFH] call CBA_fnc_removePerFrameHandler;
