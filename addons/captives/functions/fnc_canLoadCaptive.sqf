/*
 * Author: commy2
 * Check if the unit can load the target object into a vehicle.
 *
 * Arguments:
 * 0: Unit that wants to load a captive <OBJECT>
 * 1: A captive. ObjNull for the first escorted captive <OBJECT>
 * 2: Vehicle to load the captive into. ObjNull for the nearest vehicle <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * -
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_objects"];

PARAMS_3(_unit,_target,_vehicle);

if (isNull _target) then {
    _objects = attachedObjects _unit;
    _objects = [_objects, {_this getVariable ["ACE_isCaptive", false]}] call EFUNC(common,filter);
    _target = _objects select 0;
};

if (isNull _vehicle) then {
    _objects = nearestObjects [_unit, ["Car", "Tank", "Helicopter", "Plane", "Ship_F"], 10];
    _vehicle = _objects select 0;
};

_unit getVariable ["ACE_isEscorting", false]
&& {!isNil "_target"}
&& {!isNil "_vehicle"}
&& {_vehicle emptyPositions "cargo" > 0}
