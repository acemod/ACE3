/*
 * Author: commy2
 * Unit loads the target object into a vehicle.
 *
 * Arguments:
 * 0: Unit that wants to load a captive <OBJECT>
 * 1: A captive. ObjNull for the first escorted captive <OBJECT>
 * 2: Vehicle to load the captive into. ObjNull for the nearest vehicle <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [bob, tom, car] call ACE_captives_fnc_doLoadCaptive
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_unit,_target,_vehicle);
private "_objects";

if (isNull _target) then {
    _objects = attachedObjects _unit;
    _objects = [_objects, {_this getVariable [QGVAR(isHandcuffed), false]}] call EFUNC(common,filter);
    if ((count _objects) > 0) then {_target = _objects select 0;};
};
if (isNull _target) exitWith {};

if (isNull _vehicle) then {
    _objects = nearestObjects [_unit, ["Car_F", "Tank_F", "Helicopter_F", "Boat_F", "Plane_F"], 10];
    if ((count _objects) > 0) then {_vehicle = _objects select 0;};
};
if (isNull _vehicle) exitWith {};

if ((!isNil "_target") && {!isNil "_vehicle"}) then {
    _unit setVariable [QGVAR(isEscorting), false, true];
    ["MoveInCaptive", [_target], [_target, _vehicle]] call EFUNC(common,targetEvent);
};
