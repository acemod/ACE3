/*
 * Author: commy2
 *
 * Check if unit can drop the carried object.
 *
 * Arguments:
 * 0: Unit that currently carries a object <OBJECT>
 * 1: Object that is carried <OBJECT>
 *
 * Return Value:
 * Can the unit drop the object? <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];

if !([_unit, _target, ["isNotCarrying"]] call EFUNC(common,canInteractWith)) exitWith {false};

_unit getVariable [QGVAR(carriedObject), objNull] == _target
