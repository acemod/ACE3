#include "..\script_component.hpp"
/*
 * Author: Brostrom.A, johnb43
 * Lock or unlock the given weapon based on weapon state.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: State <BOOL>
 * 3: Show hint <BOOL> (default: true)
 * 4: Muzzle <STRING> (default: current muzzle of weapon)
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]],
    ["_weapon", "", [""]],
    ["_state", true, [true]],
    ["_hint", true, [true]],
    ["_muzzle", nil, [""]]
];

private _isMuzzleDefined = !isNil "_muzzle";

if (_weapon == "" || {_isMuzzleDefined && {_muzzle == ""}}) exitWith {};

// Invalid muzzle
if (_isMuzzleDefined && {
    private _configWeapon = configFile >> "CfgWeapons" >> _weapon;

    // Get config case muzzle names
    private _muzzles = (getArray (_configWeapon >> "muzzles")) apply {
        if (_x == "this") then {
            configName _configWeapon
        } else {
            configName (_configWeapon >> _x)
        };
    };

    private _index = _muzzles findIf {_x == _muzzle};

    if (_index == -1) exitWith {
        true
    };

    // Make sure that muzzle is in the proper case
    _muzzle = _muzzles select _index;

    false
}) exitWith {};

// Get current weapon muzzle if not defined
if (!_isMuzzleDefined) then {
    _muzzle = (_unit weaponState _weapon) select 1;
};

// Weapon is not available
if (_muzzle == "") exitWith {};

// If the weapon is already in the desired state, don't do anything
if (_state == (_muzzle in ((_unit getVariable [QGVAR(safedWeapons), createHashMap]) getOrDefault [_weapon, createHashMap]))) exitWith {};

[_unit, _weapon, _muzzle, _hint] call FUNC(lockSafety);
