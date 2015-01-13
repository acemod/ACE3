/*
 * Author: commy2
 *
 * Get the commander config of a vehicles turret.
 *
 * Argument:
 * 0: vehicle type (String)
 *
 * Return value:
 * Commander config (Config)
 */
#include "script_component.hpp"

private ["_vehicle", "_config", "_turret"];

_vehicle = _this select 0;

_config = configFile >> "CfgVehicles" >> _vehicle;
_turret = [_vehicle] call FUNC(getTurretCommander);

[_config, _turret] call FUNC(getTurretConfigPath)
