/*
 * Author: commy2
 * Get the turret index of a units current turret.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Turret Index <ARRAY>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];

private ["_vehicle", "_turrets", "_units", "_index"];

_vehicle = vehicle _unit;

if (_unit == _vehicle) exitWith {[]};

_turrets = allTurrets [_vehicle, true];

_units = [];

{
    _units pushBack (_vehicle turretUnit _x);
    false
} count _turrets;

_index = _units find _unit;

if (_index == -1) exitWith {[]};

_turrets select _index;
