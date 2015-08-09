/*
 * Author: commy2
 * Check if the unit can remove given wheel of the vehicle.
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 * 1: vehicle to repair <OBJECT>
 * 2: Selected hitpoint <STRING>
 *
 * Return Value:
 * NONE
 */
#include "script_component.hpp"

params ["_unit", "_target", "_hitPoint"];
TRACE_3("params",_unit,_target,_hitPoint);

if !([_unit, _target, []] call EFUNC(common,canInteractWith)) exitWith {false};

alive _target && {_target getHitPointDamage _hitPoint < 1}
