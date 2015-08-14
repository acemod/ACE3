/*
 * Author: Glowbal
 * Get nearest vehicle, priority car, air, tank, ship
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return value:
 * Vehicle that is in Distance <OBJECT>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_loadCar", "_loadHelicopter", "_loadTank", "_loadShip"];
params ["_unit"];

_loadCar = nearestObject [_unit, "car"];
if (_unit distance _loadCar <= MAX_LOAD_DISTANCE) exitwith {_loadCar};

_loadHelicopter = nearestObject [_unit, "air"];
if (_unit distance _loadHelicopter <= MAX_LOAD_DISTANCE) exitwith {_loadHelicopter};

_loadTank = nearestObject [_unit, "tank"];
if (_unit distance _loadTank <= MAX_LOAD_DISTANCE) exitwith {_loadTank};

_loadShip = nearestObject [_unit, "ship"];
if (_unit distance _loadShip <= MAX_LOAD_DISTANCE) exitwith {_loadShip};

objNull;
