#include "script_component.hpp"
/*
 * Author: commy2
 * Check if the unit can remove given wheel/track of the vehicle.
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 * 1: Vehicle to repair <OBJECT>
 * 2: Selected hitpoint <STRING>
 *
 * Return Value:
 * Can Remove <BOOL>
 *
 * Example:
 * [unit, vehicle, "hitpoint"] call ace_repair_fnc_canRemove
 *
 * Public: No
 */

params ["_unit", "_target", "_hitPoint"];
TRACE_3("params",_unit,_target,_hitPoint);

if !([_unit, _target, ["isNotDragging", "isNotCarrying", "isNotOnLadder"]] call EFUNC(common,canInteractWith)) exitWith {false};

alive _target && {_target getHitPointDamage _hitPoint < 1}
