#include "..\script_component.hpp"
/*
 * Author: commy2
 * Checks if unit can drop the dragged object.
 *
 * Arguments:
 * 0: Unit that is currently dragging an object <OBJECT>
 * 1: Object being dragged <OBJECT>
 *
 * Return Value:
 * Can the unit drop the object? <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_dragging_fnc_canDrop;
 *
 * Public: No
 */

params ["_unit", "_target"];

if !([_unit, _target, ["isNotDragging", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};

_unit getVariable [QGVAR(draggedObject), objNull] == _target
