/*
 * Author: KoffeinFlummi
 *
 * Starts watching the target for sideways correction.
 *
 * Arguments:
 * 0: Vehicle
 *
 * Return Value:
 * none
 */

#include "script_component.hpp"

private ["_vehicle", "_turret", "_distance", "_weaponDirection"];

_vehicle = _this select 0;
_turret = _this select 1;

_distance = call FUNC(getRange);

if !(call FUNC(canUseFCS)) exitWith {};

GVAR(Enabled) = true;
GVAR(Time) = time;

if (_distance == 0) then {
    _distance = [5, 5000, 0] call EFUNC(common,getTargetDistance); // maximum distance: 5000m, 5m precision
};

_weaponDirection = _vehicle weaponDirection (_vehicle currentWeaponTurret _turret);

GVAR(Position) = [
    (getPos _vehicle select 0) + _distance * (_weaponDirection select 0),
    (getPos _vehicle select 1) + _distance * (_weaponDirection select 1),
    (getPos _vehicle select 2) + _distance * (_weaponDirection select 2)
];
