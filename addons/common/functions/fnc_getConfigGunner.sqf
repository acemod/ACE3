/*
 * Author: commy2
 * Get the gunner config of a vehicles turret.
 *
 * Arguments:
 * 0: vehicle <OBJECT>
 *
 * Return Value:
 * Gunner config <CONFIG>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_vehicle"];

private ["_config", "_turret"];

_config = configFile >> "CfgVehicles" >> typeOf _vehicle;
_turret = [_vehicle] call FUNC(getTurretGunner);

[_config, _turret] call FUNC(getTurretConfigPath) // return
