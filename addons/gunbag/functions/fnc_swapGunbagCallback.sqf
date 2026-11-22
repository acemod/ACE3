#include "..\script_component.hpp"
/*
 * Author: Ir0n1E, mjc4wilton
 * Swap primary weapon and weapon in gunbag.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_gunbag_fnc_swapGunbagCallback
 *
 * Public: No
 */

params ["_unit", "_target"];

// Set up current weapon for storing
private _gunbag = backpackContainer _target;
private _currentItems = (getUnitLoadout _unit) select 0;

private _currentMagazines = _currentItems select [4, 2];
_currentItems deleteRange [4, 2];

private _currentWeapon = _currentItems deleteAt 0;

// Set up weapon in gunbag
private _newState = _gunbag getVariable [QGVAR(gunbagWeapon), []];

if (_newState isEqualTo []) exitWith {
    [LLSTRING(empty)] call EFUNC(common,displayTextStructured);
};

_newState params ["_newWeapon", "_newItems", "_newMagazines"];

// Swap Weapons
_unit removeWeapon _currentWeapon;

[_unit, _newWeapon, true, _newMagazines] call EFUNC(common,addWeapon);

// Add attachments
{
    _unit addWeaponItem [_newWeapon, _x, true];
} forEach (_newItems select {_x != ""});

_unit selectWeapon _newWeapon;

// Replace weapon in gunbag
private _state = [_currentWeapon, _currentItems, _currentMagazines];
_gunbag setVariable [QGVAR(gunbagWeapon), _state, true];

// Update virtual load
[_target, _state] call FUNC(updateMass);
