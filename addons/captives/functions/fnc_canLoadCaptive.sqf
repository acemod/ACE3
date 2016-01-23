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
 * [player, bob, car] call ACE_captives_fnc_canLoadCaptive
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target","_vehicle"];

if ((isNull _target) && {_unit getVariable [QGVAR(isEscorting), false]}) then {
    //Looking at a vehicle while escorting, get target from attached objects:
    {
        if (_x getVariable [QGVAR(isHandcuffed), false]) exitWith {
            _target = _x;
        };
    } forEach (attachedObjects _unit);
};
if ((isNull _target) || {(vehicle _target) != _target} || {!(_target getVariable [QGVAR(isHandcuffed), false])}) exitWith {false};

if (isNull _vehicle) then {
    //Looking at a captive unit, search for nearby vehicles with valid seats:
    {
        if ((_x emptyPositions "cargo") > 0) exitWith {
            _vehicle = _x;
        };
    } forEach (nearestObjects [_unit, ["Car", "Tank", "Helicopter", "Plane", "Ship"], 10]);
} else {
    //We have a vehicle picked, make sure it has empty seats:
    if ((_vehicle emptyPositions "cargo") == 0) then {
        _vehicle = objNull;
    };
};

(!isNull _vehicle)
