#include "..\script_component.hpp"
/*
 * Author: KJW
 * Checks if the unit should drop their weapon based on projectile hit info.
 *
 * Arguments:
 * 0: Surface type <STRING>
 * 1: Components <ARRAY>
 * 2: Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["", [], [1, 1, 1], player] call ace_hitreactions_fnc_checkWeaponDrop
 *
 * Public: No
 */

params ["_surfaceType", "_components", "_position", "_hitEntity"];

private _roll = random 1;
private _passedArm = _roll < GVAR(weaponDropChanceArmHit);
private _passedGun = _roll < GVAR(weaponDropChanceGunHit);

private _didHitArm = _components findAny GVAR(armComponents) != -1;
private _didHitGun = _surfaceType isEqualTo "" && _components isEqualTo [];  // for potential edge cases

if !(_didHitArm && _passedArm || _didHitGun && _passedGun) exitWith {};

if (isNull _hitEntity) then {
    _hitEntity = nearestObject [_position, "CAManBase"];
};

private _weapon = currentWeapon _hitEntity;

if (_weapon in GVAR(undroppableGuns)) exitWith {};

[QGVAR(dropGun), _hitEntity, _hitEntity] call CBA_fnc_targetEvent;
