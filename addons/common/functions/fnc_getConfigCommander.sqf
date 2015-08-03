/*
 * Author: commy2
 *
 * Get the commander config of a vehicles turret.
 *
 * Argument:
 * 0: vehicle (Object)
 *
 * Return value:
 * Commander config (Config)
 */
#include "script_component.hpp"

private ["_config", "_turret"];

params ["_vehicle"];

_config = configFile >> "CfgVehicles" >> typeOf _vehicle;
_turret = [_vehicle] call FUNC(getTurretCommander);

[_config, _turret] call FUNC(getTurretConfigPath)
