#include "..\script_component.hpp"
/*
 * Author: KJW
 * Checks if unit should drop weapon based on projectile hit info
 *
 * Arguments:
 * 0: surfaceType <STRING>
 * 1: components <ARRAY>
 * 2: position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["", [], [1,1,1]] call ACE_hitreactions_fnc_checkWeaponDrop
 *
 * Public: No
 */

params ["_surfaceType", "_components", "_position"];

private _didHitArm = _components findAny GVAR(armComponents) isNotEqualTo -1;
private _didHitGun = _surfaceType isEqualTo "" && _components isEqualTo [];  // Could be potential for edge cases here however couldn't find any from testing.

if !(_didHitArm || _didHitGun) exitWith {};

private _unit = nearestObject [_position, "CAManBase"];
private _weapon = currentWeapon _unit;

if (_weapon in GVAR(undroppableGuns)) exitWith {};

[QGVAR(dropGun), [_unit], _unit] call CBA_fnc_targetEvent;
