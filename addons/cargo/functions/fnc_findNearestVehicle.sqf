/*
 * Author: Glowbal
 * Get nearest vehicle, priority car, air, tank, ship
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return value:
 * Can load <BOOL>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_vehicle"];
params ["_unit"];

_vehicle = nearestObject [_unit, "car"];
if (_unit distance _vehicle <= MAX_LOAD_DISTANCE) exitwith {_vehicle};

_loadhelicopter = nearestObject [_unit, "air"];
if (_unit distance _vehicle <= MAX_LOAD_DISTANCE) exitwith {_vehicle};

_loadtank = nearestObject [_unit, "tank"];
if (_unit distance _vehicle <= MAX_LOAD_DISTANCE) exitwith {_vehicle};

_loadtank = nearestObject [_unit, "ship"];
if (_unit distance _vehicle <= MAX_LOAD_DISTANCE) exitwith {_vehicle};

objNull;
