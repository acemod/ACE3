/*
 * Author: commy2
 *
 * Check if unit can drag the object. Doesn't check weight.
 *
 * Argument:
 * 0: Unit that should do the dragging (Object)
 * 1: Object to drag (Object)
 *
 * Return value:
 * Can the unit drag the object? (Bool)
 */
#include "script_component.hpp"

private ["_unit", "_target"];

_unit = _this select 0;
_target = _this select 1;

if !([_unit, _target, []] call EFUNC(common,canInteractWith)) exitWith {false};

// a static weapon has to be empty for dragging
if ((typeOf _target) isKindOf "StaticWeapon" && {count crew _target > 0}) exitWith {false};

alive _target && {vehicle _target == _target} && {_target getVariable [QGVAR(canDrag), false]} && {animationState _target in ["", "unconscious"] || (_target getvariable ["ACE_isUnconscious", false]) || (_target isKindOf "CAManBase" && {(_target getHitPointDamage "HitLegs") > 0.4})};