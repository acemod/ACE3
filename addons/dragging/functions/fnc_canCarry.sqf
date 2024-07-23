#include "..\script_component.hpp"
/*
 * Author: commy2, Dystopian
 * Checks if unit can carry the object. Doesn't check weight.
 *
 * Arguments:
 * 0: Unit that should do the carrying <OBJECT>
 * 1: Object to carry <OBJECT>
 *
 * Return Value:
 * Can the unit carry the object? <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_dragging_fnc_canCarry
 *
 * Public: No
 */

params ["_unit", "_target"];

if !(alive _target && {_target getVariable [QGVAR(canCarry), false]} && {isNull objectParent _target}) exitWith {false};

if !([_unit, _target, []] call EFUNC(common,canInteractWith)) exitWith {false};

// #2644 - Units with injured legs cannot bear the extra weight of carrying an object
// The fireman carry animation does not slow down for injured legs, so you could carry and run
if ((_unit getHitPointDamage "HitLegs") >= 0.5) exitWith {false};

// Static weapons need to be empty for carrying (ignore UAV AI)
if (_target isKindOf "StaticWeapon") exitWith {
    (crew _target) findIf {!unitIsUAV _x} == -1
};

// Units need to be unconscious or limping; Units also need to not be in ragdoll, as that causes desync issues
if (_target isKindOf "CAManBase") exitWith {
    isAwake _target && // not ragdolled
    {lifeState _target == "INCAPACITATED" ||
    {_target getHitPointDamage "HitLegs" >= 0.5}}
};

// Check max items for WeaponHolders
if (["WeaponHolder", "WeaponHolderSimulated"] findIf {_target isKindOf _x} != -1) exitWith {
    (count (weaponCargo _target + magazineCargo _target + itemCargo _target)) <= MAX_DRAGGED_ITEMS
};

true // return
