/*
 * Author: voiper
 * Create and throw IR chemlight.
 *
 * Arguments:
 * 1: Original throw projectile <OBJECT>
 * 2: Class of projectile <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_projectile, _ammoType] call ace_chemlights_fnc_throwIR;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_projectile", "_ammo"];

private _config = configFile >> "CfgAmmo" >> _ammo;
private _dummyClass = getText (_config >> "ACE_Chemlight_IR");
private _pos = getPosATL _projectile;
private _velocity = velocity _projectile;

deleteVehicle _projectile;
private _dummy = _dummyClass createVehicle _pos;
_dummy setPosATL _pos;
[_dummy, 90, 0] call BIS_fnc_setPitchBank;
_dummy setVelocity _velocity;
