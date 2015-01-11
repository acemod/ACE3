/*
 * Author: bux578
 *
 * Gets the turret index of door gunners
 * 
 * Argument:
 * 0: Vehicle type (String)
 * 
 * Return value:
 * Turret indexes of the door gunner. Empty array means no gunner position. (Array)
 */

  /*
  Name: FUNC(getDoorTurrets)
  
  Author(s):
    bux578
  
  Description:
    Returns the turret indices of door gunners
  
  Parameters:
    0: STRING - vehicle type
  
  Returns:
    ARRAY<NUMBER>
*/
 
private ["_vehicleType", "_turrets", "_doorTurrets", "_config"];

_vehicleType = _this select 0;

_turrets = [_vehicleType] call FUNC(getTurrets);

_doorTurrets = [];

{
  _config = configFile >> "CfgVehicles" >> _vehicleType;
  _config = [_config, _x] call FUNC(getTurretConfigPath);

  if ((getNumber (_config >> "isCopilot") == 0) && count (getArray (_config >> "weapons")) > 0 ) then {
    _doorTurrets pushBack _x;
  };
} forEach _turrets;

_doorTurrets
