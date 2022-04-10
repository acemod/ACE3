#include "script_component.hpp"
/*
 * Author: commy2, Brett Mayson
 * Check if the unit can patch a wheel not on a vehicle.
 *
 * Arguments:
 * 0: Unit that does the patching <OBJECT>
 * 1: Wheel to patch <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, vehicle] call ace_repair_fnc_canPatchRemovedWheel
 *
 * Public: No
 */

params ["_unit", "_target"];
TRACE_2("params",_unit,_target);

if (GVAR(patchWheelEnabled) == -1) exitWith {false};
if !("ground" in GVAR(patchWheelLocation)) exitWith {false};

if !([_unit, GVAR(patchWheelEnabled)] call FUNC(isEngineer)) exitWith {false};

(damage _target > GVAR(patchWheelMaximumRepair))
