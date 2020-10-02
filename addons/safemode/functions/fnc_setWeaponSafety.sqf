#include "script_component.hpp"
/*
 * Author: Brostrom.A
 * Safe or unsafe the given weapon based on weapon state; locked or unlocked.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: State <BOOL>
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
    ["_state", true, [true]]
];

if (_weapon == "") exitWith {};

private _safedWeapons = _unit getVariable [QGVAR(safedWeapons), []];

_weapon = configName (configFile >> "CfgWeapons" >> _weapon);

private _muzzle = currentMuzzle _unit;

if !(_state isEqualTo (_weapon in _safedWeapons)) then {
    [_unit, _weapon, _muzzle] call FUNC(lockSafety);
};
