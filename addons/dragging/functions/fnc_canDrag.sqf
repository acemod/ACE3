#include "..\script_component.hpp"
/*
 * Author: commy2, Dystopian
 * Checks if unit can drag the object. Doesn't check weight.
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

private _alive = alive _target;
private _isPerson = _target isKindOf "CAManBase";

if !((_alive || _isPerson) && {_target getVariable [QGVAR(canDrag), false]} && {isNull objectParent _target}) exitWith {false};

if !([_unit, _target, ["isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};

// Units need to be unconscious or limping; Units also need to not be in ragdoll if alive, as that causes desync issues
if (_isPerson) exitWith {
    ((!_alive) && {missionNamespace getVariable [QGVAR(canMoveDead), true]}) ||
    {(isAwake _target) && // not ragdolled if alive
    {!(_target call EFUNC(common,isAwake)) ||
    {_target getHitPointDamage "HitLegs" >= 0.5}}}
};

// Static weapons need to be empty for dragging (ignore UAV AI)
if (_target isKindOf "StaticWeapon") exitWith {
    (crew _target) findIf {!unitIsUAV _x} == -1
};

// Check max items for WeaponHolders
if (["WeaponHolder", "WeaponHolderSimulated"] findIf {_target isKindOf _x} != -1) exitWith {
    (count (weaponCargo _target + magazineCargo _target + itemCargo _target)) <= MAX_DRAGGED_ITEMS
};

true // return
