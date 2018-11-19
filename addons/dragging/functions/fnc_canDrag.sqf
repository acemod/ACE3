#include "script_component.hpp"
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
 * [player, cursorTarget] call ace_dragging_fnc_canDrag
 *
 * Public: No
 */

params ["_unit", "_target"];

if !([_unit, _target, ["isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};

private _targetClass = typeOf _target;

// a static weapon has to be empty for dragging (ignore UAV AI)
if (
    _targetClass isKindOf "StaticWeapon"
    && {-1 < crew _target findIf {(getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "simulation")) != "UAVPilot"}}
) exitWith {false};

alive _target
&& {vehicle _target == _target}
&& {_target getVariable [QGVAR(canDrag), false]}
&& {
    animationState _target in ["", "unconscious"]
    || {_target getVariable ["ACE_isUnconscious", false]}
    || {_target isKindOf "CAManBase" && {(_target getHitPointDamage "HitLegs") > 0.4}}
}
&& { // check max items without box
    -1 == ["WeaponHolder", "WeaponHolderSimulated"] findIf {_targetClass isKindOf _x}
    || {MAX_DRAGGED_ITEMS >= count (weaponCargo _target + magazineCargo _target + itemCargo _target)}
}
