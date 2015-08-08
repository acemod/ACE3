/*
 * Author: commy2
 *
 * Get the turret index of a vehicles commander.
 *
 * Arguments:
 * 0: Vehicle (Object)
 *
 * Return Value:
 * Turret index of the vehicles commander. Empty array means no observer position. (Array)
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_turrets", "_turret", "_config"];

params ["_vehicle"];

_turrets = allTurrets [_vehicle, true];

_turret = [];
{
  _config = configFile >> "CfgVehicles" >> typeOf _vehicle;

  _config = [_config, _x] call FUNC(getTurretConfigPath);

  if (getNumber (_config >> "primaryObserver") == 1) exitWith {
    _turret = _x;
  };
  true
} count _turrets;
_turret
