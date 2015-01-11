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

private ["_vehicle", "_delta", "_min", "_max", "_distance"];

_vehicle = _this select 0;
_delta = _this select 1;

_min = getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "AGM_FCSMinDistance");
_max = getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "AGM_FCSMaxDistance");
_distance = _vehicle getVariable ["AGM_FCSDistance", _min];

_distance = _distance + _delta;
_distance = _distance min _max;
_distance = _distance max _min;

[_vehicle, 0, _distance] call AGM_FCS_fnc_keyUp;
