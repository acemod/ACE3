/*
 * Author: commy2
 *
 * Check if unit can carry the object. Doesn't check weight.
 *
 * Arguments:
 * 0: Unit that should do the carrying <OBJECT>
 * 1: Object to carry <OBJECT>
 *
 * Return Value:
 * Can the unit carry the object? <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];

if !([_unit, _target, []] call EFUNC(common,canInteractWith)) exitWith {false};

// a static weapon has to be empty for dragging (ignore UAV AI)
if (((typeOf _target) isKindOf "StaticWeapon") && {{(getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "simulation")) != "UAVPilot"} count crew _target > 0}) exitWith {false};

alive _target && {vehicle _target == _target} && {_target getVariable [QGVAR(canCarry), false]} && {animationState _target in ["", "unconscious"] || (_target getVariable ["ACE_isUnconscious", false]) || (_target isKindOf "CAManBase" && {(_target getHitPointDamage "HitLegs") > 0.4})}
