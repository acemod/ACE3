/*
 * Author: commy2
 *
 * Get the gunner config of a vehicles turret.
 * 
 * Argument:
 * 0: vehicle type (String)
 * 
 * Return value:
 * Gunner config (Config)
 */

private ["_vehicle", "_config", "_turret"];

_vehicle = _this select 0;

_config = configFile >> "CfgVehicles" >> _vehicle;
_turret = [_vehicle] call GVAR(fnc_getTurretGunner);

[_config, _turret] call GVAR(fnc_getTurretConfigPath)
