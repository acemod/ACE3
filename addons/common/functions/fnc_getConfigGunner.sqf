#include "script_component.hpp"
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
 * Example:
 * [car] call ace_common_fnc_getConfigGunner
 *
 * Public: Yes
 */

params ["_vehicle"];

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;
private _turret = _vehicle call FUNC(getTurretGunner);

[_config, _turret] call FUNC(getTurretConfigPath) // return
