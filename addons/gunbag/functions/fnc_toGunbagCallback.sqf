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

private _mass = [_weapon, _items, _magazines apply {_x select 0}] call FUNC(calculateMass);

_unit removeWeapon _weapon;

// Add virtual load
[_target, _gunbag, _mass] call EFUNC(movement,addLoadToUnitContainer);

_gunbag setVariable [QGVAR(gunbagWeapon), [_weapon, _items, _magazines], true];

// Play sound
if (["ace_backpacks"] call EFUNC(common,isModLoaded)) then {
    [_target, _gunbag] call EFUNC(backpacks,backpackOpened);
};
