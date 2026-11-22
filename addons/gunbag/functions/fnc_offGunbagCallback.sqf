#include "..\script_component.hpp"
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
 * [player, cursorObject] call ace_gunbag_fnc_offGunbagCallback
 *
 * Public: No
 */

params ["_unit", "_target"];

private _gunbag = backpackContainer _target;

private _state = _gunbag getVariable [QGVAR(gunbagWeapon), []];

if (_state isEqualTo []) exitWith {
    [LLSTRING(empty)] call EFUNC(common,displayTextStructured);
};

_state params ["_weapon", "_items", "_magazines"];

[_unit, _weapon, true, _magazines] call EFUNC(common,addWeapon);

// Add attachments
{
    _unit addWeaponItem [_weapon, _x, true];
} forEach (_items select {_x != ""});

_unit selectWeapon _weapon;

_gunbag setVariable [QGVAR(gunbagWeapon), [], true];

// Remove virtual load
[_target, []] call FUNC(updateMass);

// Play sound
if (["ace_backpacks"] call EFUNC(common,isModLoaded)) then {
    [_target, _gunbag] call EFUNC(backpacks,backpackOpened);
};
