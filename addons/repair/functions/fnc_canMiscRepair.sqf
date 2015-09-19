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

private ["_hitpointGroupConfig", "_hitpointGroup", "_postRepairDamage", "_return"];
params ["_caller", "_target", "_hitPoint"];

if !([_unit, _target, ["isNotDragging", "isNotCarrying", "isNotOnLadder"]] call EFUNC(common,canInteractWith)) exitWith {false};

// Get hitpoint groups if available
_hitpointGroupConfig = configFile >> "CfgVehicles" >> typeOf _target >> QGVAR(hitpointGroups);
_hitpointGroup = [];
if (isArray _hitpointGroupConfig) then {
    // Retrieve hitpoint subgroup if current hitpoint is main hitpoint of a group
    {
        // Exit using found hitpoint group if this hitpoint is leader of any
        if (_x select 0 == _hitPoint) exitWith {
            _hitpointGroup = _x select 1;
        };
    } forEach (getArray _hitpointGroupConfig);
};

// Add current hitpoint to the group
_hitpointGroup pushBack _hitPoint;

// Get post repair damage
_postRepairDamage = [_caller] call FUNC(getPostRepairDamage);

// Return true if damage can be repaired on any hitpoint in the group, else false
_return = false;
{
    if ((_target getHitPointDamage _x) > _postRepairDamage) exitWith {
        _return = true;
    };
} forEach _hitpointGroup;

if (typeOf _target == "B_MRAP_01_F") then {
    diag_log format ["%1 - %2", _hitPoint, _hitpointGroup];
};

_return
