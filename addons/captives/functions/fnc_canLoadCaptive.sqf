/*
 * Author: commy2
 * Check if the unit can load the target object into a vehicle.
 *
 * Arguments:
 * 0: Unit that wants to load a captive <OBJECT>
 * 1: A captive. ObjNull for the first escorted captive (may be null) <OBJECT>
 * 2: Vehicle to load the captive into. ObjNull for the nearest vehicle (may be null) <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [player, bob] call ACE_captives_fnc_canLoadCaptive
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_objects"];
params ["_unit", "_target","_vehicle"];

if (isNull _target) then {
    _objects = attachedObjects _unit;
    _objects = [_objects, {_this getVariable [QGVAR(isHandcuffed), false]}] call EFUNC(common,filter);
    if ((count _objects) > 0) then {_target = _objects select 0;};
};

if (isNull _vehicle) then {
    _objects = nearestObjects [_unit, ["Car", "Tank", "Helicopter", "Plane", "Ship_F"], 10];
    if ((count _objects) > 0) then {_vehicle = _objects select 0;};
};

(!isNull _target)
&& {!isNull _vehicle}
&& {_unit getVariable [QGVAR(isEscorting), false]}
&& {_target getVariable [QGVAR(isHandcuffed), false]}
&& {_vehicle emptyPositions "cargo" > 0}
