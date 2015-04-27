/*
 * Author: Ruthberg
 * Calculates a new scope base angle
 *
 * Arguments:
 * 0: Bullet mass <NUMBER>
 * 1: Bore height <NUMBER>
 * 2: air friction <NUMBER>
 * 3: muzzle velocity <NUMBER>
 * 4: zero range <NUMBER>
 *
 * Return Value:
 * scope base angle <NUMBER>
 *
 * Example:
 * call ace_atragmx_calculate_scope_base_angle
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_bulletMass", "_boreHeight", "_airFriction", "_muzzleVelocity", "_zeroRange"];
_bulletMass     = _this select 0;
_boreHeight     = _this select 1;
_airFriction    = _this select 2;
_muzzleVelocity = _this select 3;
_zeroRange      = _this select 4;

private ["_scopeBaseAngle"];
_scopeBaseAngle = 0;

private ["_temperature", "_barometricPressure", "_relativeHumidity"];
_temperature = 15;
_barometricPressure = 1013.25;
_relativeHumidity = 0;

private ["_result"];
_result = [_scopeBaseAngle, _bulletMass, _boreHeight, _airFriction, _muzzleVelocity, _temperature, _barometricPressure, _relativeHumidity, 1000, [0, 0], 0, 0, 0, _zeroRange, _airFriction, 1, "ICAO", false, 1.5, 0, 0, 0] call FUNC(calculate_solution);

_scopeBaseAngle + (_result select 0) / 60
