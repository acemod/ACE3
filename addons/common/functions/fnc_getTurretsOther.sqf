/*
 * Author: commy2
 *
 * Get the turret indices of other turrets (not gunner, commander, copilot or ffv).
 *
 * Arguments:
 * 0: Vehicle (Object)
 *
 * Return value:
 * Turret index of the vehicles gunner. Empty array means no other turrets. (Array)
 */
#include "script_component.hpp"

private ["_turrets", "_turret", "_config"];

params ["_vehicle"];

_turrets = allTurrets [_vehicle, true];

_turret = [];
{
    _config = configFile >> "CfgVehicles" >> typeOf _vehicle;

    _config = [_config, _x] call FUNC(getTurretConfigPath);

    if (  getNumber (_config >> "isCopilot") != 1
      && {getNumber (_config >> "primaryGunner") != 1}
      && {getNumber (_config >> "primaryObserver") != 1}
      && {getNumber (_config >> "isPersonTurret") != 1}
    ) then {
        _turret pushBack _x;
    };
    true
} count _turrets;
_turret
