#include "script_component.hpp"
/*
 * Author: commy2
 * Handle Air burst ammunition. Called from per frame handler.
 *
 * Arguments:
 * -
 *
 * Return Value:
 * None
 *
 * Example:
 * [[array]] call ace_fcs_fnc_handleAirBurstAmmunitionPFH
 *
 * Public: No
 */

(_this select 0) params ["_vehicle", "_projectile", "_zeroing"];

// remove pfh if the projectile died before arriving
if (isNull _projectile || {!alive _projectile}) exitWith {
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};

// wait if not there
if (_projectile distance _vehicle < _zeroing) exitWith {};

// explode
private _position = getPosATL _projectile;

private _subMunition = createVehicle ["ACE_B_35mm_ABM_Helper", _position, [], 0, "FLY"];

_subMunition setPosATL _position;
_subMunition setVelocity [0, 0, -10];

deleteVehicle _projectile;

[_this select 1] call CBA_fnc_removePerFrameHandler;
