#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Getter for weapon safety state.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Muzzle <STRING> (default: current muzzle of weapon)
 *
 * Return Value:
 * Safety status <BOOL>
 *
 * Example:
 * [ACE_player, currentWeapon ACE_player] call ace_safemode_fnc_getWeaponSafety
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]],
    ["_weapon", "", [""]],
    ["_muzzle", nil, [""]]
];

if (_weapon == "" || {!(_unit hasWeapon _weapon)}) exitWith {false};

// Check if weapon is a binocular
if ((_weapon call EFUNC(common,getItemType)) select 1 == "binocular") exitWith {false};

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
if (_muzzle == "") exitWith {false};

_muzzle in ((_unit getVariable [QGVAR(safedWeapons), createHashMap]) getOrDefault [_weapon, createHashMap]) // return
