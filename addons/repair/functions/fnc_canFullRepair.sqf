#include "..\script_component.hpp"
/*
 * Author: Ivanowicz
 * Check if vehicle has non-empty hitpoint damage array and if any of the hitpoints has damage.
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 * 1: Vehicle to repair <OBJECT>
 *
 * Return Value:
 * Can Full Repair <BOOL>
 *
 * Example:
 * [unit, vehicle] call ace_repair_fnc_canFullRepair
 *
 * Public: No
 */

params ["_unit", "_target"];
TRACE_2("params",_unit,_target);

private _allHitPointsDamage = getAllHitPointsDamage _target;

if (_allHitPointsDamage isNotEqualTo []) then {
    ((_allHitPointsDamage select 2) findIf {_x > 0} != -1)
} else {
    (damage _target) > 0
};
