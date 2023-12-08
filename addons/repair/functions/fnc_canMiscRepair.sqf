#include "..\script_component.hpp"
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
 * [unit, vehicle, 5] call ace_repair_fnc_canMiscRepair
 *
 * Public: No
 */

params ["_unit", "_vehicle", "_hitPointIndex"];
TRACE_3("params",_unit,_vehicle,_hitPointIndex);

(getAllHitPointsDamage _vehicle) params ["_hitPoints", "", "_damageValues"];

if !([_unit, _vehicle, ["isNotDragging", "isNotCarrying", "isNotSwimming", "isNotOnLadder"]] call EFUNC(common,canInteractWith)) exitWith {false};

// Get hitpoint groups if available
private _hitPointGroupConfig = configOf _vehicle >> QGVAR(hitpointGroups);
private _hitPointGroup = [];
if (isArray _hitPointGroupConfig) then {
    private _hitPointClassname = _hitPoints select _hitPointIndex;

    // Retrieve hitpoint subgroup if current hitpoint is main hitpoint of a group
    {
        _x params ["_masterHitPoint", "_subHitArray"];
        // Exit using found hitpoint group if this hitpoint is leader of any
        if (_masterHitPoint == _hitPointClassname) exitWith {
            {
                private _subHitPoint = _x;
                private _subHitIndex = _hitPoints findIf {_x == _subHitPoint};
                if (_subHitIndex == -1) then {
                    ERROR_2("Invalid hitpoint %1 in hitPointGroups of %2",_subHitPoint,_vehicle);
                } else {
                    _hitPointGroup pushBack _subHitIndex;
                };
            } forEach _subHitArray;
        };
    } forEach (getArray _hitPointGroupConfig);
};

// Add current hitpoint to the group
_hitPointGroup pushBack _hitPointIndex;

// Get post repair damage
private _postRepairDamage = [_unit] call FUNC(getPostRepairDamage);

// Return true if damage can be repaired on any hitpoint in the group, else false
private _return = false;
{
    if ((_damageValues select _x) > _postRepairDamage) exitWith {
        _return = true;
    };
} forEach _hitPointGroup;

_return
