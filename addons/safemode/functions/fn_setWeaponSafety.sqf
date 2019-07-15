/*
 * Author: Brostrom.A
 * Safe or unsafe the given weapon based on weapon state; locked or unlocked.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 3: State <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, true] call ace_safemode_fnc_safeWeapon
 *
 * Public: yes
 */

params [
    ["_unit", objNull, [objNull]], 
    ["_state", true, [true]]
];

private _safedWeapons = _unit getVariable [QGVAR(safedWeapons), []];

private _weapon = currentWeapon _unit;
_weapon = configName (configFile >> "CfgWeapons" >> _weapon);

private _muzzle = currentMuzzle _unit;
_muzzle = configName (configFile >> "CfgWeapons" >> _muzzle);

if !(_state isEqualTo (_weapon in _safedWeapons)) then {
    [_unit, _weapon, _muzzle] call FUNC(lockSafety);
};
