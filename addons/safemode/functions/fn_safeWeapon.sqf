/*
 * Author: Brostrom.A
 * Safe or unsafe the given weapon based on weapon state; locked or unlocked.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Muzzle <STRING>
 * 3: State <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, currentWeapon ACE_player, currentMuzzle Ace_player, true] call ace_safemode_fnc_safeWeapon
 *
 * Public: yes
 */

params [
    ["_unit", objNull, [objNull]], 
    ["_weapon", "", [""]],
    ["_muzzle", "", [""]],
    ["_state", true, [true]]
];

private _safedWeapons = _unit getVariable [QGVAR(safedWeapons), []];

_weapon = configName (configFile >> "CfgWeapons" >> _weapon);

if ((_state && ((_safedWeapons findIf {_weapon == _x}) == -1)) || (!_state && (!(_safedWeapons findIf {_weapon == _x}) == -1)))then {
    [_unit, _weapon, _muzzle] call FUNC(lockSafety);
};
