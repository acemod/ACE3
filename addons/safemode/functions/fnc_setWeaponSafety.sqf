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

// Don't allow to set weapon safety if unit doesn't have one (but allow removing safety, in case unit doesn't have weapon anymore)
if (_weapon == "" || {_state && {!(_unit hasWeapon _weapon)}}) exitWith {};

// Check if weapon is a binocular
if ((_weapon call EFUNC(common,getItemType)) select 1 == "binocular") exitWith {};

// Check for invalid muzzles
_muzzle = if (isNil "_muzzle") then {
    // Get current weapon muzzle if not defined
    (_unit weaponState _weapon) select 1
} else {
    // Get config case muzzle names
    private _muzzles = _weapon call EFUNC(common,getWeaponMuzzles);

    _muzzles param [_muzzles findIf {_x == _muzzle}, ""]
};

// Weapon is not available
if (_muzzle == "") exitWith {};

// If the weapon is already in the desired state, don't do anything
if (_state == (_muzzle in ((_unit getVariable [QGVAR(safedWeapons), createHashMap]) getOrDefault [_weapon, createHashMap]))) exitWith {};

[_unit, _weapon, _muzzle, _hint] call FUNC(lockSafety);
