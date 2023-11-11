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
 * ["", [], [1, 1, 1]] call ace_hitreactions_fnc_checkWeaponDrop
 *
 * Public: No
 */

params ["_surfaceType", "_components", "_position"];

private _didHitArm = _components findAny GVAR(armComponents) != -1;
private _didHitGun = _surfaceType isEqualTo "" && _components isEqualTo [];  // for potential edge cases

if !(_didHitArm || _didHitGun) exitWith {};

private _unit = nearestObject [_position, "CAManBase"];
private _weapon = currentWeapon _unit;

if (_weapon in GVAR(undroppableGuns)) exitWith {};

[QGVAR(dropGun), [_unit], _unit] call CBA_fnc_targetEvent;
