/*
 * Author: commy2
 *
 * Get the turret index of a units current turret.
 *
 * Arguments:
 * 0: Unit, not the vehicle (as in not a car but the player) (Object)
 *
 * Return value:
 * Turret index array or config path. E.g: [0] for gunner or [0,0] for commander. Returns empty array if unit is not in a turret. (Array)
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_vehicle", "_turrets", "_units", "_index"];

params ["_unit"];
_vehicle = vehicle _unit;

if (_unit == _vehicle) exitWith {[]};

_turrets = allTurrets [_vehicle, true];

_units = [];
{
  _units pushBack (_vehicle turretUnit _x);
  true
} count _turrets;

_index = _units find _unit;

if (_index == -1) exitWith {[]};

_turrets select _index;
