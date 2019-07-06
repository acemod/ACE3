/*
 * Author: Brostrom.A
 * Safe the given weapon if unlocked.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Muzzle <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call ace_safemode_fnc_safeWeapon
 *
 * Public: yes
 */

params ["_unit", "_weapon", "_muzzle"];

private _safedWeapons = _unit getVariable [QGVAR(safedWeapons), []];

if !(_weapon in _safedWeapons) then { 
    [_unit, _weapon, _muzzle] call FUNC(lockSafety);
};
