#include "..\script_component.hpp"
/*
 * Author: Ir0n1E
 * Put weapon into gunbag.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_gunbag_fnc_toGunbagCallback
 *
 * Public: No
 */

params ["_unit", "_target"];

// Set up current weapon for storing
private _gunbag = backpackContainer _target;
private _items = (getUnitLoadout _unit) select 0;

private _magazines = _items select [4, 2];
_items deleteRange [4, 2];

private _weapon = _items deleteAt 0;

_unit removeWeapon _weapon;

private _state = [_weapon, _items, _magazines];
_gunbag setVariable [QGVAR(gunbagWeapon), _state, true];

// Add virtual load
[_target, _state] call FUNC(updateMass);

// Play sound
if (["ace_backpacks"] call EFUNC(common,isModLoaded)) then {
    [_target, _gunbag] call EFUNC(backpacks,backpackOpened);
};
