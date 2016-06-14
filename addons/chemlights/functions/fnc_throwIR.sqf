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
private ["_config", "_classX", "_pos", "_velocity", "_vector", "_vehX"];

_config = configFile >> "CfgAmmo" >> _ammo;
_classX = getText (_config >> "ACE_Chemlight_IR");
_pos = getPosATL _projectile;
_velocity = velocity _projectile;

deleteVehicle _projectile;
_vehX = _classX createVehicle _pos;
_vehX setPosATL _pos;
[_vehX, 90, 0] call BIS_fnc_setPitchBank;
_vehX setVelocity _velocity;
