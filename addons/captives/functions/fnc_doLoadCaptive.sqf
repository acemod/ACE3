/*
 * Author: commy2
 * Unit loads the target object into a vehicle. (logic same as canLoadCaptive)
 *
 * Arguments:
 * 0: Unit that wants to load a captive <OBJECT>
 * 1: A captive. ObjNull for the first escorted captive <OBJECT>
 * 2: Vehicle to load the captive into. ObjNull for the nearest vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, tom, car] call ACE_captives_fnc_doLoadCaptive
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
if ((isNull _target) || {(vehicle _target) != _target} || {!(_target getVariable [QGVAR(isHandcuffed), false])}) exitWith {WARNING("");};

if (isNull _vehicle) then {
    //Looking at a captive unit, search for nearby vehicles with valid seats:
    {
        // if (([_x] call FUNC(findEmptyNonFFVCargoSeat)) != -1) exitWith {
        if ((_x emptyPositions "cargo") > 0) exitWith {
            _vehicle = _x;
        };
    } forEach (nearestObjects [_unit, ["Car", "Tank", "Helicopter", "Plane", "Ship"], 10]);
} else {
    // if (([_vehicle] call FUNC(findEmptyNonFFVCargoSeat)) == -1) then {
    if ((_vehicle emptyPositions "cargo") == 0) then {
        _vehicle = objNull;
    };
};

if (isNull _vehicle) exitWith {WARNING("Could not find vehicle to load captive");};

_unit setVariable [QGVAR(isEscorting), false, true];
[QGVAR(moveInCaptive), [_target, _vehicle], [_target]] call CBA_fnc_targetEvent;
