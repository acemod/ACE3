/*
 * Author: KoffeinFlummi
 *
 * Adjusts the currently zeroed distance.
 *
 * Arguments:
 * 0: The vehicle in question
 * 1: The amount to add to the distance (can be negative)
 *
 * Return Value:
 * None
 */

#include "script_component.hpp"

private ["_vehicle", "_turret", "_delta", "_turretConfig", "_min", "_max", "_distance"];

_vehicle = _this select 0;
_turret = _this select 1;
_delta = _this select 2;

_turretConfig = [configFile >> "CfgVehicles" >> typeOf _vehicle, _turret] call EFUNC(common,getTurretConfigPath);

_min = getNumber (_turretConfig >> QGVAR(MinDistance));
_max = getNumber (_turretConfig >> QGVAR(MaxDistance));
_distance = _vehicle getVariable [format ["%1_%2", QGVAR(Distance), _turret], _min];

_distance = _distance + _delta;
_distance = _distance min _max;
_distance = _distance max _min;

[_vehicle, _turret, _distance] call FUNC(keyUp);
