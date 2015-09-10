/*
 * Author: commy2
 *
 * Check if unit can drop the object.
 *
 * Arguments:
 * 0: Unit that currently drags a object <OBJECT>
 * 1: Object that is dragged <OBJECT>
 *
 * Return Value:
 * Can the unit drop the object? <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];

if !([_unit, _target, ["isNotDragging"]] call EFUNC(common,canInteractWith)) exitWith {false};

_unit getVariable [QGVAR(draggedObject), objNull] == _target
