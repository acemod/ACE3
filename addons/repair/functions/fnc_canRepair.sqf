/*
 * Author: commy2
 *
 * Check if the unit can repair given hitpoint of the vehicle.
 *
 * Arguments:
 * 0: Unit that does the repairing (Object)
 * 1: vehicle to repair (Object)
 * 2: Selected hitpoint (String)
 *
 * Return Value:
 * NONE
 */
#include "script_component.hpp"

private ["_unit", "_target", "_hitPoint"];

_unit = _this select 0;
_target = _this select 1;
_hitPoint = _this select 2;

if !([_unit, _target, []] call EFUNC(common,canInteractWith)) exitWith {false};

if !([_unit, GVAR(engineerSetting_Repair)] call FUNC(isEngineer)) exitWith {false};

alive _target && {_target getHitPointDamage _hitPoint > ([_unit] call FUNC(getPostRepairDamage))}
