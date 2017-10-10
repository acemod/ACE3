/*
 * Author: commy2
 * Check if unit can drag the object. Doesn't check weight.
 *
 * Arguments:
 * 0: Unit that should do the dragging <OBJECT>
 * 1: Object to drag <OBJECT>
 *
 * Return Value:
 * Can the unit drag the object? <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_dragging_fnc_canDrag;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];

if !([_unit, _target, ["isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};

// a static weapon has to be empty for dragging (ignore UAV AI)
if ((typeOf _target) isKindOf "StaticWeapon" && {{(getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "simulation")) != "UAVPilot"} count crew _target > 0}) exitWith {false};

alive _target && {vehicle _target == _target} && {_target getVariable [QGVAR(canDrag), false]} && {animationState _target in ["", "unconscious"] || (_target getVariable ["ACE_isUnconscious", false]) || (_target isKindOf "CAManBase" && {(_target getHitPointDamage "HitLegs") > 0.4})};
