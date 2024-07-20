#include "..\script_component.hpp"
/*
 * Author: Brett Mayson
 * Calculate the time to patch the wheel
 *
 * Arguments:
 * 0: Unit that does the patching <OBJECT>
 * 1: Vehicle to patch <OBJECT>
 * 2: Selected wheel hitpoint <STRING>
 *
 * Return Value:
 * Patching time <NUMBER>
 *
 * Example:
 * [unit, vehicle, "hitpoint"] call ace_repair_fnc_getPatchWheelTime
 *
 * Public: No
 */

params ["_unit", "_vehicle", "_hitPoint"];

// get current hitpoint damage
private _hitPointDamage = (_vehicle getHitPointDamage _hitPoint) - GVAR(patchWheelMaximumRepair);

ceil (_hitPointDamage / PATCH_WHEEL_STEP_TIME) * GVAR(patchWheelTime)
