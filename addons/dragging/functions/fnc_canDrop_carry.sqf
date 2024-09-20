#include "..\script_component.hpp"
/*
 * Author: commy2
 * Checks if unit can drop the carried object.
 *
 * Arguments:
 * 0: Unit that is currently carrying an object <OBJECT>
 * 1: Object being carried <OBJECT>
 *
 * Return Value:
 * Can the unit drop the object? <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_dragging_fnc_canDrop_carry;
 *
 * Public: No
 */

params ["_unit", "_target"];

if !([_unit, _target, ["isNotCarrying"]] call EFUNC(common,canInteractWith)) exitWith {false};

_unit getVariable [QGVAR(carriedObject), objNull] == _target
