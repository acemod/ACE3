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
 * [unit, vehicle, "hitpoint"] call ace_repair_fnc_canMiscRepair
 *
 * Public: No
 */
 #define DEBUG_MODE_FULL
#include "script_component.hpp"

private ["_hitpointGroupConfig", "_hitpointGroup", "_postRepairDamage", "_return", "_maxDamage", "_xHit"];
params ["_caller", "_target", "_hitPoint"];

if !([_caller, _target, ["isNotDragging", "isNotCarrying", "isNotOnLadder"]] call EFUNC(common,canInteractWith)) exitWith {false};

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

(getAllHitPointsDamage _target) params ["_allHitPoints", "", "_allHitPointDamages"];

// Return true if damage can be repaired on any hitpoint in the group, else false
_return = false;
{
    //Get the max damage for all hitpoints of that name:
    _xHit = _x;
    _maxDamage = 0;
    {
        if ((_x == _xHit) && {(_allHitPointDamages select _forEachIndex) > _maxDamage}) then {
            _maxDamage = _allHitPointDamages select _forEachIndex;
        };
    } forEach _allHitPoints;
    TRACE_2("hitpoint",_x,_maxDamage);
    
    if (_maxDamage > _postRepairDamage) exitWith {
        _return = true;
    };
} forEach _hitpointGroup;

_return
