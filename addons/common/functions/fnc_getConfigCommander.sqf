/*
 * Author: commy2
 * Get the commander config of a vehicles turret.
 *
 * Arguments:
 * 0: vehicle <OBJECT>
 *
 * Return Value:
 * Commander config <CONFIG>

 * Example:
 * [car] call ace_common_fnc_getConfigCommander
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_vehicle"];

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;
private _turret = _vehicle call FUNC(getTurretCommander);

[_config, _turret] call FUNC(getTurretConfigPath) // return
