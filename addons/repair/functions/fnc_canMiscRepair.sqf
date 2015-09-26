/*
 * Author: Jonpas
 * Check if misc repair action can be done, called from callbackSuccess.
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 * 1: Vehicle to repair <OBJECT>
 * 2: Selected hitpoint INDEX <NUMBER>
 *
 * Return Value:
 * Can Misc Repair <BOOL>
 *
 * Example:
 * [unit, vehicle, "hitpoint"] call ace_repair_fnc_canMiscRepair
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_hitpointGroupConfig", "_hitpointGroup", "_postRepairDamage", "_return", "_hitPointClassname", "_subHitIndex"];
params ["_caller", "_target", "_hitPointIndex"];

(getAllHitPointsDamage _target) params ["_allHitPoints", "", "_allHitPointDamages"];

if !([_caller, _target, ["isNotDragging", "isNotCarrying", "isNotOnLadder"]] call EFUNC(common,canInteractWith)) exitWith {false};

// Get hitpoint groups if available
_hitpointGroupConfig = configFile >> "CfgVehicles" >> typeOf _target >> QGVAR(hitpointGroups);
_hitpointGroup = [];
if (isArray _hitpointGroupConfig) then {
    _hitPointClassname = _allHitPoints select _hitPointIndex;

    // Retrieve hitpoint subgroup if current hitpoint is main hitpoint of a group
    {
        _x params ["_masterHitpoint", "_subHitArray"];
        // Exit using found hitpoint group if this hitpoint is leader of any
        if (_masterHitpoint == _hitPointClassname) exitWith {
            {
                _subHitIndex = _allHitPoints find _x;
                if (_subHitIndex == -1) then {
                    ERROR("Hitpoint Not Found");
                } else {
                    _hitpointGroup pushBack _subHitIndex;
                };
            } forEach _subHitArray;
        };
    } forEach (getArray _hitpointGroupConfig);
};

// Add current hitpoint to the group
_hitpointGroup pushBack _hitPointIndex;

// Get post repair damage
_postRepairDamage = [_caller] call FUNC(getPostRepairDamage);

// Return true if damage can be repaired on any hitpoint in the group, else false
_return = false;
{
    if ((_allHitPointDamages select _x) > _postRepairDamage) exitWith {
        _return = true;
    };
} forEach _hitpointGroup;

_return
