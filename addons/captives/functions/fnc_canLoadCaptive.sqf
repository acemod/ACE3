#include "script_component.hpp"
/*
 * Author: commy2
 * Check if the unit can load the target object into a vehicle.
 *
 * Arguments:
 * 0: Unit that wants to load a captive <OBJECT>
 * 1: A captive. objNull for the first escorted captive <OBJECT>
 * 2: Vehicle to load the captive into. objNull for the nearest vehicle <OBJECT>
 *
 * Return Value:
 * Can load captive <BOOL>
 *
 * Example:
 * [bob, tom, car] call ace_captives_fnc_canLoadCaptive
 *
 * Public: No
 */

params ["_unit", "_target", "_vehicle"];

// Don't show "Load Captive" if unit is unconscious (already has "Load Patient")
if (_target getVariable ["ACE_isUnconscious", false]) exitWith {false};

if ((isNull _target) && {_unit getVariable [QGVAR(isEscorting), false]}) then {
    //Looking at a vehicle while escorting, get target from attached objects:
    {
        if (_x getVariable [QGVAR(isHandcuffed), false]) exitWith {
            _target = _x;
        };
    } forEach (attachedObjects _unit);
};
if (isNull _target || {(vehicle _target) != _target} || {!(_target getVariable [QGVAR(isHandcuffed), false])}) exitWith {false};

if (isNull _vehicle) then {
    // Looking at a captive unit, get nearest vehicle with valid seat:
    _vehicle = (_target call EFUNC(common,nearestVehiclesFreeSeat)) param [0, objNull];
} else {
    // We have a vehicle picked, make sure it has empty seats:
    if (_vehicle emptyPositions "cargo" == 0 && {_vehicle emptyPositions "gunner" == 0}) then {
        _vehicle = objNull;
    };
};

!isNull _vehicle
