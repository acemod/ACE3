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
    ["_hint", true, [true]]
];

if (_weapon == "") exitWith {};

private _currentMuzzle = (_unit weaponState _weapon) select 1;

// Weapon is not available
if (_currentMuzzle == "") exitWith {};

// If the weapon is already in the desired state, don't do anything
if (_state == (((_unit getVariable [QGVAR(safedWeapons), createHashMap]) getOrDefault [_weapon, []]) findIf {_x select 0 == _currentMuzzle} != -1)) exitWith {};

[_unit, _weapon, _currentMuzzle, _hint] call FUNC(lockSafety);
