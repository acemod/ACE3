/*
 * Author: Jonpas
 * Check if misc repair action can be done, called from callbackSuccess.
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 * 1: Vehicle to repair <OBJECT>
 * 2: Selected hitpoint <STRING>
 *
 * Return Value:
 * Can Misc Repair <BOOL>
 *
 * Example:
 * [unit, vehicle, "hitpoint", "classname"] call ace_repair_fnc_canMiscRepair
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_hitpointGroup", "_postRepairDamage", "_return"];
params ["_caller", "_target", "_hitPoint"];

// Check hitpoint group
_hitpointGroup = configFile >> "CfgVehicles" >> typeOf _target >> QGVAR(hitpointGroup);
_hitpointGroup = if (isArray _hitpointGroup) then {getArray _hitpointGroup} else {[]};

if !(_hitPoint in _hitpointGroup) then {
    _hitpointGroup pushBack _hitPoint;
};

_postRepairDamage = [_caller] call FUNC(getPostRepairDamage);

_return = false;
{
    if ((_target getHitPointDamage _x) > _postRepairDamage) exitWith {
        _return = true;
    };
} forEach _hitpointGroup;

_return
