#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Checks the conditions for being able to disarm a unit.
 *
 * Arguments:
 * 0: Caller <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Can target be disarmed? <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_disarming_fnc_canPlayerDisarmUnit
 *
 * Public: No
 */

params ["_caller", "_target"];

(objectParent _caller) isEqualTo (objectParent _target) &&
{_target call FUNC(canBeDisarmed)} &&
{[_caller, _target, ["isNotSwimming"]] call EFUNC(common,canInteractWith)}
