#include "script_component.hpp"
/*
 * Author: commy2, Brett Mayson
 * Check if the unit can patch given wheel of the vehicle.
 *
 * Arguments:
 * 0: Unit that does the patching <OBJECT>
 * 1: Vehicle to patch <OBJECT>
 * 2: Selected wheel hitpoint <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, vehicle, "hitpoint"] call ace_repair_fnc_canPatchWheel
 *
 * Public: No
 */

params ["_unit", "_target", "_hitPoint"];
TRACE_3("params",_unit,_target,_hitPoint);

if (GVAR(patchWheelEnabled) == -1) exitWith {false};

private _damage = _target getHitPointDamage _hitPoint;

if (_damage == 1) exitWith {false};

if !([_unit, _target, ["isNotDragging", "isNotCarrying", "isNotOnLadder"]] call EFUNC(common,canInteractWith)) exitWith {false};

(_damage > GVAR(patchWheelMaximumRepair))
