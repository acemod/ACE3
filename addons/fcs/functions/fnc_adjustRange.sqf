/*
 * Author: KoffeinFlummi
 * Adjusts the currently zeroed distance.
 *
 * Arguments:
 * 0: The vehicle in question <OBJECT>
 * 1: The Turrets that the Vehicle has <ARRAY>
 * 2: The amount to add to the distance (can be negative) <NUMMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, [], 5] call ace_fcs_fnc_adjustRange
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_turret", "_delta"];

private _turretConfig = [configFile >> "CfgVehicles" >> typeOf _vehicle, _turret] call EFUNC(common,getTurretConfigPath);

private _min = getNumber (_turretConfig >> QGVAR(MinDistance));
private _max = getNumber (_turretConfig >> QGVAR(MaxDistance));

private _distance = _vehicle getVariable [format ["%1_%2", QGVAR(Distance), _turret], _min];
TRACE_4("",_distance,_delta,_min,_max);

_distance = _distance + _delta;
_distance = _distance min _max;
_distance = _distance max _min;

[_vehicle, _turret, _distance] call FUNC(keyUp);
