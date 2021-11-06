#include "script_component.hpp"
/*
 * Author: Pterolatypus
 * Calculates total weapon inertia, accounting for attachments.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Total inertia <NUMBER>
 *
 * Example:
 * [ACE_player] call ace_advanced_fatigue_fnc_getWeaponInertia
 *
 * Public: No
 */
params [["_unit", ACE_player, [objNull]]];

private _cache = GVAR(inertiaCache);
private _weapon = currentWeapon _unit;
private _accessories = _unit weaponAccessories _weapon;
private _key = _weapon + "$";
{
	_key = _key + "+" + _x;
} forEach _accessories;

private _inertia = _cache get _key;
if (isNil "_inertia") then {
	_inertia = 0;
	{
		if (isNumber (configFile >> "CfgWeapons" >> _x >> "inertia")) then {
			_inertia = _inertia + getNumber (configFile >> "CfgWeapons" >> _x >> "inertia");
		};
	} forEach [_weapon] + _accessories;
	_cache set [_key, _inertia];
};

GVAR(inertia) = _inertia;
_inertia