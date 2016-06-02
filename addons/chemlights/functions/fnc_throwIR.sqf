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
 * [_projectile, _ammoType] call ace_chemlights_fnc_createIRChemlight;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_projectile", "_ammo"];
private ["_config", "_class", "_classX", "_delay", "_lifeTime", "_pos", "_velocity", "_vector", "_vehX"];

_config = configFile >> "CfgAmmo" >> _ammo;
_class = getText (_config >> "ACE_Chemlight_IR");
_classX = getText (_config >> "ACE_Chemlight_IR_X");
_delay = getNumber (_config >> "explosionTime");
_lifeTime = getNumber (_config >> "timeToLive");
_pos = getPosATL _projectile;
_velocity = velocity _projectile;

deleteVehicle _projectile;
_vehX = _classX createVehicle _pos;
_vehX setPosATL _pos;
[_vehX, 90, 0] call BIS_fnc_setPitchBank;
_vehX setVelocity _velocity;

[{
    params ["_vehX", "_class", "_lifeTime"];
    private _lightMarker = _class createVehicle [0,0,0];
    _lightMarker attachTo [_vehX, [0,0,0]];
    [QGVAR(IRTimer), [_vehX, _lightMarker, _lifeTime]] call CBA_fnc_serverEvent;
}, [_vehX, _class, _lifeTime], _delay] call CBA_fnc_waitAndExecute;