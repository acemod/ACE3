/*
 * Author: commy2
 *
 * Check if unit can drop the object.
 *
 * Argument:
 * 0: Unit that currently drags a object (Object)
 * 1: Object that is dragged (Object)
 *
 * Return value:
 * Can the unit drop the object? (Bool)
 */
#include "script_component.hpp"

private ["_unit", "_target"];

_unit = _this select 0;
_target = _this select 1;

if !([_unit, _target, ["isNotDragging"]] call EFUNC(common,canInteractWith)) exitWith {false};

_unit getVariable [QGVAR(draggedObject), objNull] == _target
