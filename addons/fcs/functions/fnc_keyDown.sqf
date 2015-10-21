/*
 * Author: KoffeinFlummi
 *
 * Starts watching the target for sideways correction.
 *
 * Arguments:
 * 0: Vehicle
 * 1: Turret
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

if !(!GVAR(enabled) && FUNC(canUseFCS)) exitWith {};

private ["_distance", "_weaponDirection"];
params ["_vehicle", "_turret"];

_distance = call FUNC(getRange);

GVAR(Enabled) = true;
GVAR(Time) = ACE_time;

if (_distance == 0) then {
    _distance = [5, 5000, 0] call EFUNC(common,getTargetDistance); // maximum distance: 5000m, 5m precision
};

_weaponDirection = _vehicle weaponDirection (_vehicle currentWeaponTurret _turret);  // @todo doesn't work for sub turrets

if (_turret isEqualTo ([_vehicle] call EFUNC(common,getTurretCommander))) then {
    _weaponDirection = eyeDirection _vehicle;
};

if (_weaponDirection isEqualTo [0,0,0]) then {  // dummy value for non main turrets
    _weaponDirection = [1,0,0];
};
_weaponDirection params ["_dirX", "_dirY", "_dirZ"];
(getPos _vehicle) params ["_posX", "_posY", "_posZ"];
GVAR(Position) = [
    _posX + _distance * _dirX,
    _posY + _distance * _dirY,
    _posZ + _distance * _dirZ
];
