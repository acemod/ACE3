#include "..\script_component.hpp"
/*
 * Author: commy2
 * The unit will put its current weapon away.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_weaponselect_fnc_putWeaponAway
 *
 * Public: Yes
 */

params ["_unit"];

_unit action ["SwitchWeapon", _unit, _unit, 299];
