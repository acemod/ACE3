/*
 * Author: Ir0n1E
 * Get weapon out of gunbag.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, target] call ace_gunbag_fnc_offGunbagCallback
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];

private _gunbag = backpackContainer _target;

private _state = _gunbag getVariable [QGVAR(gunbagWeapon), []];

if (_state isEqualTo []) exitWith {
    [localize LSTRING(empty)] call EFUNC(common,displayTextStructured);
};

_state params ["_weapon", "_items", "_magazines"];

_unit addWeapon _weapon;
removeAllPrimaryWeaponItems _unit;

{
    _unit addWeaponItem [_weapon, _x];
} forEach (_items + _magazines);

_unit selectWeapon _weapon;

_magazines = _magazines apply {_x select 0};

private _mass = [_weapon, _items, _magazines] call FUNC(calculateMass);

// remove virtual load
[_target, _gunbag, -_mass] call EFUNC(movement,addLoadToUnitContainer);
_gunbag setVariable [QGVAR(gunbagWeapon), [], true];

// play sound
if (["ace_backpacks"] call EFUNC(common,isModLoaded)) then {
    [_target, _gunbag] call EFUNC(backpacks,backpackOpened);
};
