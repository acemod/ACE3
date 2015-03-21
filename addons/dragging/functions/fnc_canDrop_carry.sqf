/*
 * Author: commy2
 *
 * Check if unit can drop the carried object.
 *
 * Argument:
 * 0: Unit that currently carries a object (Object)
 * 1: Object that is carried (Object)
 *
 * Return value:
 * Can the unit drop the object? (Bool)
 */
#include "script_component.hpp"

private ["_unit", "_target"];

_unit = _this select 0;
_target = _this select 1;

if !([_unit, _target, ["isNotCarrying"]] call EFUNC(common,canInteractWith)) exitWith {false};

_unit getVariable [QGVAR(carriedObject), objNull] == _target
