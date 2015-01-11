/*
 * Author: commy2
 *
 * Check if the unit can load the target object into a vehicle.
 * 
 * Argument:
 * 0: Unit that wants to load a captive (Object)
 * 1: A captive. ObjNull for the first escorted captive (Object)
 * 2: Vehicle to load the captive into. ObjNull for the nearest vehicle (Object)
 * 
 * Return value:
 * Boolean (Bool)
 */

private ["_unit", "_target", "_vehicle", "_objects"];

_unit = _this select 0;
_target = _this select 1;
_vehicle = _this select 2;

if (isNull _target) then {
  _objects = attachedObjects _unit;
  _objects = [_objects, {_this getVariable ["AGM_isCaptive", false]}] call AGM_Core_fnc_filter;
  _target = _objects select 0;
};

if (isNull _vehicle) then {
  _objects = nearestObjects [_unit, ["Car", "Tank", "Helicopter", "Plane", "Ship_F"], 10];
  _vehicle = _objects select 0;
};

_unit getVariable ["AGM_isEscorting", false]
&& {!isNil "_target"}
&& {!isNil "_vehicle"}
&& {_vehicle emptyPositions "cargo" > 0}
