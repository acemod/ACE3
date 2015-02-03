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

private ["_vehicle", "_delta", "_min", "_max", "_distance"];

_vehicle = _this select 0;
_delta = _this select 1;

_min = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(MinDistance));
_max = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(MaxDistance));
_distance = _vehicle getVariable [QGVAR(Distance), _min];

_distance = _distance + _delta;
_distance = _distance min _max;
_distance = _distance max _min;

[_vehicle, 0, _distance] call FUNC(keyUp);
