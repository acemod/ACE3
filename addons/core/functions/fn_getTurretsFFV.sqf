/*
 * Author: commy2
 *
 * Get the turret indices of ffv turrets.
 *
 * Argument:
 * 0: Vehicle type (String)
 *
 * Return value:
 * Turret index of the vehicles gunner. Empty array means no ffv turrets. (Array)
 */

private ["_vehicle", "_turrets", "_turret", "_config"];

_vehicle = _this select 0;

_turrets = [_vehicle] call GVAR(fnc_getTurrets);

_turret = [];
{
  _config = configFile >> "CfgVehicles" >> _vehicle;

  _config = [_config, _x] call GVAR(fnc_getTurretConfigPath);

  if (getNumber (_config >> "isPersonTurret") == 1) then {
    _turret pushBack _x;
  };
} forEach _turrets;
_turret
